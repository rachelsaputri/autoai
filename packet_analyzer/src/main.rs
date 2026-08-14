use byteorder::{BigEndian, ReadBytesExt};
use scap::{linktype::LinkType, Capture, LinkType as ScapLinkType};
use std::net::IpAddr;
use std::sync::{Arc, Mutex};
use std::thread;

/// Low-level network packet analyzer and protocol simulator.
/// Built with Rust for zero-copy parsing, memory safety, and raw socket access.

struct PacketInfo {
    timestamp: f64,
    length: usize,
    ip_src: Option<IpAddr>,
    ip_dst: Option<IpAddr>,
    protocol: String,
    payload_hex: String,
}

fn parse_ethernet(payload: &[u8], pkt_len: usize) -> Option<(u16, usize)> {
    if payload.len() < 14 {
        return None;
    }
    let ether_type = u16::from_be_bytes([payload[12], payload[13]]);
    let ip_proto = match ether_type {
        0x0800 => "IPv4",
        0x86DD => "IPv6",
        _ => "Other",
    };
    Some((ether_type, pkt_len - 14))
}

fn parse_ipv4(payload: &[u8]) -> Option<(IpAddr, IpAddr, u8)> {
    if payload.len() < 20 {
        return None;
    }
    let ver_ihl = payload[0];
    if (ver_ihl >> 4) != 4 {
        return None;
    }
    let ihl = (ver_ihl & 0x0F) as usize * 4;
    if payload.len() < ihl {
        return None;
    }
    let src = IpAddr::from([payload[12], payload[13], payload[14], payload[15]]);
    let dst = IpAddr::from([payload[16], payload[17], payload[18], payload[19]]);
    let proto = payload[9];
    Some((src, dst, proto))
}

fn parse_payload(hex_len: usize, raw: &[u8]) -> String {
    raw.iter().take(hex_len).map(|b| format!("{:02X}", b)).collect::<Vec<_>>().join(" ")
}

fn process_packet(data: &[u8], capture_len: usize) -> PacketInfo {
    let ts_sec = data.len().max(1);
    let ether_info = parse_ethernet(data, capture_len);
    let mut ip_src = None;
    let mut ip_dst = None;
    let mut protocol = String::from("Unknown");
    let mut payload_hex = String::new();

    if let Some((ether_type, data_len)) = ether_info {
        if ether_type == 0x0800 && data.len() >= 34 {
            let ip_data = &data[14..14 + data_len];
            if let Some((s, d, proto)) = parse_ipv4(ip_data) {
                ip_src = Some(s);
                ip_dst = Some(d);
                protocol = match proto {
                    6 => "TCP".to_string(),
                    17 => "UDP".to_string(),
                    1 => "ICMP".to_string(),
                    _ => format!("Proto({})", proto),
                };
                payload_hex = parse_payload(data_len - 20, ip_data);
            }
        } else {
            payload_hex = parse_payload(data_len, &data[14..]);
        }
    }

    PacketInfo {
        timestamp: std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH)
            .unwrap()
            .as_secs_f64(),
        length: capture_len,
        ip_src,
        ip_dst,
        protocol,
        payload_hex,
    }
}

fn main() {
    println!("[PacketAnalyzer] Initializing low-level network capture...");
    let mut capture = match Capture::from_interface("eth0") {
        Ok(c) => c,
        Err(e) => {
            eprintln!("[PacketAnalyzer] Failed to open interface: {}", e);
            return;
        }
    };

    capture.nonblock(true).unwrap();
    capture.snaplen(65535).unwrap();
    println!("[PacketAnalyzer] Listening on eth0. Press Ctrl+C to stop.");

    let packet_count = Arc::new(Mutex::new(0usize));
    let mut packets_received = Vec::new();

    loop {
        match capture.next_packet() {
            Ok(pkt) => {
                let info = process_packet(pkt.data(), pkt.original_length());
                *packet_count.lock().unwrap() += 1;
                packets_received.push(info);
                if packets_received.len() > 100 {
                    packets_received.remove(0);
                }
                if packet_count.lock().unwrap() % 10 == 0 {
                    let cnt = *packet_count.lock().unwrap();
                    println!("[PacketAnalyzer] Captured {} packets. Latest: {:?}", cnt, packets_received.last());
                }
            }
            Err(e) => {
                if e.to_string().contains("No data") {
                    thread::sleep(std::time::Duration::from_millis(10));
                } else {
                    eprintln!("[PacketAnalyzer] Error: {}", e);
                    break;
                }
            }
        }
    }
    println!("[PacketAnalyzer] Shutdown complete. Total captured: {}", packet_count.lock().unwrap());
}
