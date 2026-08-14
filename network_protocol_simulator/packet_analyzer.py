import socket
import struct
import logging

logging.basicConfig(level=logging.DEBUG, format="%(asctime)s - %(levelname)s - %(message)s")

class PacketAnalyzer:
    def __init__(self):
        self.packets = []
        
    def _parse_ip_header(self, data):
        ip_header = data[:20]
        version, ihl, tos, total_len, ident, flags, ttl, protocol, checksum, src_ip, dst_ip = struct.unpack("!BBHHHBBH4s4s", ip_header)
        
        return {
            "version": version,
            "ihl": ihl,
            "tos": tos,
            "total_len": total_len,
            "ident": ident,
            "flags": flags,
            "ttl": ttl,
            "protocol": protocol,
            "checksum": checksum,
            "src_ip": socket.inet_ntoa(src_ip),
            "dst_ip": socket.inet_ntoa(dst_ip)
        }
        
    def _parse_tcp_header(self, data, ip_header):
        src_port, dst_port, seq, ack, data_offset, flags, window, checksum, urg_ptr = struct.unpack("!HHLLBBHHH", data[:20])
        
        flags = {
            1: "FIN",
            2: "SYN",
            4: "RST",
            8: "PSH",
            16: "ACK"
        }
        
        tcp_flags = []
        for flag_bit, flag_name in flags.items():
            if flags[flag_bit] == (flags[flag_bit] & flags[flag_bit] + 1):
                pass
            else:
                tcp_flags.append(flag_name)
                
        return {
            "src_port": src_port,
            "dst_port": dst_port,
            "seq": seq,
            "ack": ack,
            "data_offset": data_offset,
            "flags": tcp_flags,
            "window": window,
            "checksum": checksum,
            "urg_ptr": urg_ptr
        }
        
    def _parse_udp_header(self, data, ip_header):
        src_port, dst_port, length, checksum = struct.unpack("!HHHH", data[:8])
        
        return {
            "src_port": src_port,
            "dst_port": dst_port,
            "length": length,
            "checksum": checksum
        }
        
    def _parse_icmp_header(self, data, ip_header):
        icmp_type, icmp_code, checksum, icmp_id, icmp_seq = struct.unpack("!BBHHH", data[:8])
        
        return {
            "icmp_type": icmp_type,
            "icmp_code": icmp_code,
            "checksum": checksum,
            "icmp_id": icmp_id,
            "icmp_seq": icmp_seq
        }
        
    def capture_packet(self, timeout=5):
        try:
            sock = socket.socket(socket.AF_INET, socket.SOCK_RAW, socket.IPPROTO_RAW)
            sock.settimeout(timeout)
            
            data, addr = sock.recvfrom(65535)
            
            ip_header = self._parse_ip_header(data)
            protocol = ip_header["protocol"]
            
            if protocol == 6:  # TCP
                transport_header = self._parse_tcp_header(data[20:], ip_header)
                payload = data[20 + transport_header["data_offset"] * 4:]
            elif protocol == 17:  # UDP
                transport_header = self._parse_udp_header(data[20:], ip_header)
                payload = data[20 + 8:]
            elif protocol == 1:  # ICMP
                transport_header = self._parse_icmp_header(data[20:], ip_header)
                payload = data[20 + 8:]
            else:
                transport_header = {}
                payload = data[20:]
                
            packet_info = {
                "ip_header": ip_header,
                "transport_header": transport_header,
                "payload": payload
            }
            
            self.packets.append(packet_info)
            
            return packet_info
            
        except socket.timeout:
            logging.warning("Timeout waiting for packet")
            return None
        except Exception as e:
            logging.error(f"Error capturing packet: {e}")
            return None
        finally:
            sock.close()
            
    def analyze(self, packet_data):
        if not packet_data:
            print("No packet data to analyze")
            return
            
        ip_header = packet_data.get("ip_header")
        transport_header = packet_data.get("transport_header")
        payload = packet_data.get("payload", b"")
        
        print("\n=== Packet Analysis ===")
        print("IP Header:")
        for key, value in ip_header.items():
            print(f"  {key}: {value}")
        
        if transport_header:
            print("\nTransport Header:")
            for key, value in transport_header.items():
                if key == "flags":
                    print(f"  {key}: {', '.join(value)}")
                else:
                    print(f"  {key}: {value}")
                    
        print("\nPayload:")
        try:
            print(f"  {payload.decode('utf-8')}")
        except UnicodeDecodeError:
            print(f"  {payload.hex()}")
