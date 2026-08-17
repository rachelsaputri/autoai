# Golang Compliance Drift Detector

An automated, real-time compliance drift detection engine written in Go. This tool continuously monitors system configurations against a baseline policy, identifies deviations, and generates actionable remediation reports.

## Features
- Real-time file and configuration monitoring
- Baseline policy comparison
- Anomaly detection with configurable thresholds
- Automated alerting and reporting
- High-performance concurrent scanning

## Usage
Run the main binary to start the drift detector:
```bash
go run . -config policy.yaml -interval 5m
```

## Build
```bash
go build -o drift_detector main.go
```
