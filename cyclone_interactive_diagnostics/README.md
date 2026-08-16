# Cyclone Interactive Diagnostics

This tool provides a command-line interactive diagnostic engine for system compliance and security auditing. It runs in a CLI loop, allowing users to run audits, view system state, check for drift, and generate reports.

## Features
- Interactive command loop
- System state monitoring
- Compliance audit execution
- Drift detection
- Report generation

## Building
Compile with gcc:
```bash
gcc -o diagnostics main.c
gcc -o diagnostics main.c -lm
```

## Usage
```bash
./diagnostics
```
