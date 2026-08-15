#!/bin/bash
# SYMPL Symbolic Reasoning Engine - Verification & Build Script

set -e

echo "[*] Building SYMPL Symbolic Reasoning Engine..."
make clean all

echo "[*] Running engine tests..."
make run

echo "[*] Checking build artifacts..."
if [ -f "sympl_reasoner" ]; then
    echo "[+] Binary generated successfully."
    ./sympl_reasoner --version || true
else
    echo "[-] Build failed. Check compiler output."
    exit 1
fi

echo "[*] Verification complete."
exit 0
