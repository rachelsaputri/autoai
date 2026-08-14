#!/bin/bash

# trace_route.sh - Traceroute Script
# Traces the route to a target host using standard traceroute.

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <host>"
    echo "Example: $0 8.8.8.8"
    exit 1
fi

HOST=$1

echo "Tracing route to: $HOST"

# Try standard traceroute first
if command -v traceroute &> /dev/null; then
    traceroute -m 30 "$HOST"
else
    # Fallback to mtr if available, otherwise use ping for basic connectivity
    if command -v mtr &> /dev/null; then
        echo "traceroute not found, using mtr..."
        mtr --report "$HOST"
    else
        echo "Neither traceroute nor mtr found. Performing basic ping test..."
        ping -c 5 "$HOST"
    fi
fi

echo "Traceroute complete."
