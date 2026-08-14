#!/bin/bash

# port_check.sh - Port Scanner Script
# Checks if specific ports are open on a target host.

set -e

if [ $# -lt 2 ]; then
    echo "Usage: $0 <host> <port1,port2,...>"
    echo "Example: $0 192.168.1.1 22,80,443"
    exit 1
fi

HOST=$1
PORTS=$2

echo "Checking ports on host: $HOST"

IFS=',' read -ra PORT_ARRAY <<< "$PORTS"

for PORT in "${PORT_ARRAY[@]}"; do
    (echo > /dev/tcp/$HOST/$PORT) > /dev/null 2>&1 && echo "Port $PORT on $HOST is OPEN" || echo "Port $PORT on $HOST is CLOSED/FILTERED"
done

echo "Port check complete."
