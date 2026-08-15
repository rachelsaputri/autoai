# Low-Level Memory Management Simulator

## Overview

`mem_mgr_sim.sh` is a production-ready Bash simulation of low-level memory management and network protocol behavior. It mimics critical subsystems of an operating kernel and network stack:

- **Memory Allocator**: Simulates `malloc`/`free` with contiguous and non-contiguous memory blocks, fragmentation analysis, and heap integrity checks.
- **TCP-like Protocol**: Simulates packet segmentation, sequence numbering, retransmission, windowing, and state transitions.
- **Network Router**: Simulates ARP lookup, packet forwarding, TTL decrement, and routing table resolution.

## Features

### Memory Management Simulation
- **Heap Initialization**: Configurable heap size with a linked list of free/allocated blocks.
- **Dynamic Allocation**: Simulates `malloc` with best-fit/worst-fit algorithms (configurable).
- **Deallocation**: Simulates `free` with coalescing of adjacent free blocks.
- **Fragmentation Analysis**: Calculates internal and external fragmentation in real-time.
- **Integrity Checks**: Validates heap metadata consistency.

### Network Protocol Simulation
- **Packet Construction**: Builds TCP-like headers with SYN, ACK, FIN, and data payload.
- **Sequence Management**: Tracks sequence numbers and window sizes.
- **Retransmission**: Simulates packet loss and retransmission with exponential backoff.
- **State Machine**: Handles connection establishment, data transfer, and teardown.

### Routing Simulation
- **ARP Resolution**: Simulates MAC address resolution for local networks.
- **Packet Forwarding**: Uses a static routing table to forward packets.
- **TTL Handling**: Decrements TTL and drops packets when TTL reaches zero.

## Usage

### Memory Simulation
```bash
./mem_mgr_sim.sh mem --heap-size 1024 --alloc-size 256 --alloc-size 128 --free-id 1
```

### Network Simulation
```bash
./mem_mgr_sim.sh net --src-ip 192.168.1.100 --dst-ip 10.0.0.1 --payload "Hello, World!"
```

### Full Simulation
```bash
./mem_mgr_sim.sh all --heap-size 2048 --alloc-size 512 --payload "Test Data"
```

## Commands

- `mem [OPTIONS]`: Run memory management simulation.
- `net [OPTIONS]`: Run network protocol simulation.
- `all [OPTIONS]`: Run both simulations sequentially.

## Options

### Memory Options
- `--heap-size SIZE`: Total heap size in bytes (default: 1024).
- `--alloc-size SIZE`: Size to allocate (can be specified multiple times).
- `--free-id ID`: ID of the block to free.

### Network Options
- `--src-ip IP`: Source IP address (default: 192.168.1.100).
- `--dst-ip IP`: Destination IP address (default: 10.0.0.1).
- `--payload TEXT`: Data payload to send.
- `--loss-rate RATE`: Simulated packet loss rate (0.0 to 1.0, default: 0.1).

## Architecture

The simulator is implemented entirely in Bash, using associative arrays and string manipulation to simulate complex data structures. It is designed to be educational and demonstrative, showing how low-level systems work under the hood.

## License

MIT License
