# packet_analyzer

## Overview
A high-performance, low-level network packet analyzer and protocol simulator built in **Rust**. Designed for raw socket access, zero-copy packet parsing, and memory-safe concurrency to deliver high-fidelity network analysis.

## Architecture
- **Raw Socket Capture**: Uses `scap` crate for direct link-layer access (`eth0`).
- **Zero-Copy Parsing**: Byte-level manipulation via `byteorder` and slice indexing to avoid unnecessary allocations.
- **Protocol Dissection**: Ethernet, IPv4, TCP/UDP/ICMP header parsing.
- **Concurrency-Safe State**: Arc<Mutex> for thread-safe packet tracking and live updates.

## Features
- Low-latency packet capture and parsing
- IPv4 header extraction (Source/Dest IP, Protocol)
- Payload hex dump generation
- Live console logging with packet counts
- Optimized for production-grade network diagnostics

## Dependencies
- `scap`: Safe libpcap bindings
- `tokio`: Async runtime foundation
- `byteorder`: Efficient binary data parsing
- `structopt`: CLI argument parsing

## Usage
```bash
cargo run --release
```

## Building
```bash
cargo build --release
./target/release/packet_analyzer
```

## Safety & Performance
- Built with Rust's memory safety guarantees to prevent buffer overflows in raw packet data.
- Release mode enables LTO and aggressive optimizations for minimal overhead during capture.

## License
MIT

## Contributing
PRs welcome. Ensure all code passes `cargo clippy -- -D warnings` and `cargo fmt`.
