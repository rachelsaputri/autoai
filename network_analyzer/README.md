# Network Analyzer Tools

This directory contains robust Linux shell scripts for network analysis.

## Scripts

### scan.sh
A script to scan local networks and identify active hosts.

**Usage:**
```bash
./scan.sh [subnet]
```

Example:
```bash
./scan.sh 192.168.1.0/24
```

### port_check.sh
A script to check if specific ports are open on a target host.

**Usage:**
```bash
./port_check.sh <host> <port1,port2,...>
```

Example:
```bash
./port_check.sh 192.168.1.1 22,80,443
```

### trace_route.sh
A script to trace the route to a target host.

**Usage:**
```bash
./trace_route.sh <host>
```

Example:
```bash
./trace_route.sh 8.8.8.8
```
