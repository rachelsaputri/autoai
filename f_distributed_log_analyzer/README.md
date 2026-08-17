# F Distributed Log Analyzer

## Overview
This utility is designed to parse, correlate, and analyze distributed system logs in real-time. It operates strictly in the F programming language to ensure high-performance, low-latency processing of log streams.

## Features
- Real-time log ingestion and streaming
- Pattern matching and anomaly detection
- High-performance binary parsing
- Structured JSON/CSV output export
- Memory-safe concurrent processing

## Prerequisites
- F compiler (latest stable release)
- Standard F libraries

## Usage
```bash
fbuild main.f
./main --config config.json --input /var/log/syslog
```

## Architecture
- `main.f`: Entry point and argument parsing
- `analyzer.f`: Core log parsing and correlation engine
- `reporter.f`: Output formatting and export handlers
- `utils.f`: Shared helper functions and constants

## License
MIT License
