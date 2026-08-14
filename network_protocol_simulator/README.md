# Network Protocol Simulator

A low-level network packet analyzer and protocol simulator written in Python. This tool allows you to craft, send, and analyze raw network packets, simulating various protocols such as TCP, UDP, ICMP, and more.

## Features

- **Packet Crafting**: Create custom packets with configurable headers and payloads.
- **Protocol Simulation**: Simulate network protocols like TCP, UDP, ICMP, ARP, etc.
- **Packet Analysis**: Analyze received packets to extract header information and payload data.
- **Live Sniffing**: Optionally capture live network traffic for analysis.

## Installation

1. Clone the repository:
   ```bash
   git clone <repository_url>
   cd network_protocol_simulator
   ```

2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

## Usage

### Crafting and Sending a Packet

```python
from network_protocol_simulator import PacketCraft

craft = PacketCraft(
    src_ip="192.168.1.100",
    dst_ip="192.168.1.1",
    src_port=12345,
    dst_port=80,
    protocol="TCP"
)
craft.send_packet()
```

### Analyzing a Packet

```python
from network_protocol_simulator import PacketAnalyzer

analyzer = PacketAnalyzer()
packet_data = analyzer.capture_packet(timeout=5)
analyzer.analyze(packet_data)
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
