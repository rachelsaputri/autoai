#!/bin/bash

# scan.sh - Network Scanner Script
# Scans a given subnet for active hosts using ping sweeps.

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 [subnet]"
    echo "Example: $0 192.168.1.0/24"
    exit 1
fi

SUBNET=$1

echo "Scanning subnet: $SUBNET"

# Extract network part and mask from CIDR notation
NETWORK=$(echo $SUBNET | cut -d'/' -f1)
MASK=$(echo $SUBNET | cut -d'/' -f2 -s)

if [ -z "$MASK" ]; then
    echo "Invalid CIDR format. Please provide subnet in format x.x.x.x/y"
    exit 1
fi

# Determine the range based on mask
case $MASK in
    24) 
        PREFIX=${NETWORK%.*}
        for i in $(seq 1 254); do
            HOST="${PREFIX}.${i}"
            ping -c 1 -W 1 "$HOST" > /dev/null 2>&1 && echo "$HOST is UP" || echo "$HOST is DOWN"
        done
        ;;
    16)
        FIRST_OCTET=$(echo $NETWORK | cut -d'.' -f1)
        SECOND_OCTET=$(echo $NETWORK | cut -d'.' -f2)
        for i in $(seq 0 255); do
            for j in $(seq 1 254); do
                HOST="${FIRST_OCTET}.${SECOND_OCTET}.${i}.${j}"
                ping -c 1 -W 1 "$HOST" > /dev/null 2>&1 && echo "$HOST is UP" || echo "$HOST is DOWN"
            done
        done
        ;;
    *)
        echo "Unsupported subnet mask: /$MASK. Currently supports /24 and /16."
        exit 1
        ;;
esac

echo "Scan complete."
