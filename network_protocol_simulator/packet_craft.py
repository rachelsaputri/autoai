import socket
import struct
import random

class PacketCraft:
    def __init__(self, src_ip, dst_ip, src_port=None, dst_port=None, protocol="TCP", payload=None):
        self.src_ip = src_ip
        self.dst_ip = dst_ip
        self.src_port = src_port
        self.dst_port = dst_port
        self.protocol = protocol
        self.payload = payload or ""
        
        self.udp_packet = self._craft_udp_packet()
        self.tcp_packet = self._craft_tcp_packet()
        self.icmp_packet = self._craft_icmp_packet()
        
    def _generate_random_int(self):
        return random.randint(0, 65535)
        
    def _compute_checksum(self, header):
        sum = 0
        n = len(header) + 1
        i = 0
        while n > 1:
            sum += (header[i] << 8) + header[i+1]
            i += 2
            n -= 2
        if n:
            sum += header[i] << 8
        while (sum >> 16):
            sum = (sum & 0xFFFF) + (sum >> 16)
        sum = ~sum & 0xFFFF
        return sum
    
    def _craft_ip_header(self, protocol, payload):
        version = 4
        ihl = 5  # Internet Header Length
        tos = 0  # Type of Service
        total_len = 20 + len(payload)  # IP header + payload length
        ident = random.randint(0, 65535)
        flags = 0x4000  # Don't Fragment flag
        ttl = 64
        
        ip_header = struct.pack("!BBHHHBBH4s4s", 
                                version << 4 | ihl,
                                tos,
                                total_len,
                                ident,
                                flags,
                                ttl,
                                protocol,
                                0,  # Checksum
                                socket.inet_aton(self.src_ip),
                                socket.inet_aton(self.dst_ip))
                                
        checksum = self._compute_checksum(ip_header)
        ip_header = struct.pack("!BBHHHBBH4s4s", 
                                version << 4 | ihl,
                                tos,
                                total_len,
                                ident,
                                flags,
                                ttl,
                                protocol,
                                checksum,
                                socket.inet_aton(self.src_ip),
                                socket.inet_aton(self.dst_ip))
                                
        return ip_header
    
    def _craft_udp_packet(self):
        if not self.src_port:
            self.src_port = self._generate_random_int()
        if not self.dst_port:
            self.dst_port = self._generate_random_int()
            
        udp_header = struct.pack("!HHHH", 
                                 self.src_port,
                                 self.dst_port,
                                 8 + len(self.payload),  # Total length
                                 0)  # Checksum
                                 
        ip_header = self._craft_ip_header(socket.IPPROTO_UDP, udp_header + self.payload.encode() if isinstance(self.payload, str) else self.payload)
        packet = ip_header + udp_header + (self.payload.encode() if isinstance(self.payload, str) else self.payload)
        return packet
        
    def _craft_tcp_packet(self):
        if not self.src_port:
            self.src_port = self._generate_random_int()
        if not self.dst_port:
            self.dst_port = self._generate_random_int()
            
        seq = self._generate_random_int()
        ack = 0
        data_offset = 5
        fin = 0
        syn = 0
        rst = 0
        psh = 0
        ack_flag = 0
        urg = 0
        window = socket.ntohs(5840)
        urg_ptr = 0
        options = None
        
        if not options:
            tcp_header = struct.pack("!HHLLBBHHH", 
                                     self.src_port,
                                     seq,
                                     ack,
                                     (data_offset << 4) | (urg << 11) | (ack_flag << 9) | (psh << 8) | (rst << 7) | (syn << 6) | (fin << 5),
                                     window,
                                     0,  # Checksum
                                     urg_ptr)
            
            ip_header = self._craft_ip_header(socket.IPPROTO_TCP, tcp_header + (self.payload.encode() if isinstance(self.payload, str) else self.payload))
            packet = ip_header + tcp_header + (self.payload.encode() if isinstance(self.payload, str) else self.payload)
            return packet
        
    def _craft_icmp_packet(self):
        icmp_type = 8  # Echo Request
        icmp_code = 0
        icmp_id = self._generate_random_int()
        icmp_seq = 1
        
        icmp_header = struct.pack("!BBH", 
                                  icmp_type,
                                  icmp_code,
                                  0)  # Checksum
                                  
        checksum = self._compute_checksum(icmp_header + b"\x00" * 16)
        
        payload = self.payload.encode() if isinstance(self.payload, str) else self.payload
        if len(payload) < 16:
            payload = payload + b"\x00" * (16 - len(payload))
            
        icmp_header = struct.pack("!BBHHH", 
                                  icmp_type,
                                  icmp_code,
                                  checksum,
                                  icmp_id,
                                  icmp_seq)
                                  
        ip_header = self._craft_ip_header(socket.IPPROTO_ICMP, icmp_header + payload)
        packet = ip_header + icmp_header + payload
        return packet
        
    def send_packet(self):
        try:
            if self.protocol.upper() == "UDP":
                sock = socket.socket(socket.AF_INET, socket.SOCK_RAW, socket.IPPROTO_RAW)
                sock.setsockopt(socket.IPPROTO_IP, socket.IP_HDRINCL, 1)
            elif self.protocol.upper() == "TCP":
                sock = socket.socket(socket.AF_INET, socket.SOCK_RAW, socket.IPPROTO_RAW)
                sock.setsockopt(socket.IPPROTO_IP, socket.IP_HDRINCL, 1)
            elif self.protocol.upper() == "ICMP":
                sock = socket.socket(socket.AF_INET, socket.SOCK_RAW, socket.IPPROTO_RAW)
                sock.setsockopt(socket.IPPROTO_IP, socket.IP_HDRINCL, 1)
            else:
                raise ValueError("Unsupported protocol")
            
            if self.protocol.upper() == "UDP":
                packet = self.udp_packet
            elif self.protocol.upper() == "TCP":
                packet = self.tcp_packet
            elif self.protocol.upper() == "ICMP":
                packet = self.icmp_packet
            else:
                packet = None
                
            if packet:
                sock.sendto(packet, (self.dst_ip, 0))
                print(f"Packet sent to {self.dst_ip}:{self.dst_port}")
            else:
                print("Failed to craft packet")
                
        except Exception as e:
            print(f"Error: {e}")
        finally:
            sock.close()
