# Ada Intrusion Detection System

## Overview
This is a production-grade Intrusion Detection System (IDS) built strictly using the Ada programming language. It is designed for high-performance network traffic analysis, signature-based detection, and anomaly scoring.

## Features
- **Network Traffic Analysis**: Parses raw packet data.
- **Signature-Based Detection**: Matches traffic patterns against known threat signatures.
- **Anomaly Scoring**: Calculates risk scores based on statistical deviations.
- **Alert Dispatching**: Generates structured alerts for detected threats.

## Usage
To compile and run the system, use the `gnatmake` toolchain:

```bash
gnatmake -g main.adb
./main
```

## Configuration
Modify `config.ads` to adjust threshold values and network interfaces.

## Security
This tool is designed for internal network monitoring. Ensure all access logs are protected and reviewed regularly.
