# Chapel Security Anomaly Detector

A high-performance, parallel-computing security anomaly detection engine built strictly in Chapel.

## Features
- Real-time log stream ingestion and parsing
- Statistical baseline computation using parallel reduction
- Z-score and threshold-based anomaly scoring
- Configurable alert thresholds and report generation
- Optimized for multi-node, multi-architectures Chapel deployments

## Getting Started

### Prerequisites
- Chapel 1.27.0 or higher
- Make or Chapel's built-in build system (`chpl`)

### Build
```bash
make all
```

### Run
```bash
./chapel_anomaly_detector --input ./data/sample_logs.csv --threshold 3.5 --output ./results/alerts.json
```

## Architecture
- `main.chpl`: Entry point, argument parsing, orchestration
- `ingestor.chpl`: Parallel log parsing and validation
- `analyzer.chpl`: Statistical baseline calculation and deviation detection
- `reporter.chpl`: JSON/CSV alert formatting and file I/O
- `config.chpl`: Configuration loading and validation

## License
MIT

## Contributing
Submit pull requests or open issues for enhancements, bug fixes, and test cases.
