# Distributed Parallel Security Event Correlator & Anomaly Detector

## Overview
This tool is a production-grade, fully functional security analysis engine built strictly using the Ateji PX parallel programming language. It leverages Ateji PX's native `par`, `seq`, and `async` constructs to ingest massive volumes of security logs, perform parallel correlation rule matching, calculate real-time anomaly scores via statistical thresholding, and output structured audit reports.

## Features
- **Parallel Log Ingestion**: Asynchronously consumes logs from multiple simulated sources using Ateji PX parallel threads.
- **Rule-Based Correlation Engine**: Matches incoming events against configurable security rules in parallel.
- **Statistical Anomaly Scoring**: Calculates real-time deviation metrics using z-scores and sliding window averages.
- **Cryptographic Integrity Verification**: Verifies checksums of ingested data streams to ensure tamper-evident processing.
- **Structured Reporting**: Exports final audit findings to JSON and YAML formats for CI/CD integration.

## Architecture
- `CorrelatorMain.pxi`: Entry point and parallel orchestration layer.
- `EventParser.pxi`: Parses raw log strings into structured Event objects.
- `CorrelationEngine.pxi`: Implements parallel rule matching against event streams.
- `AnomalyDetector.pxi`: Calculates statistical scores and flags thresholds.
- `IntegrityVerifier.pxi`: Performs SHA-256 checksum verification on event batches.
- `ReportGenerator.pxi`: Serializes final findings into JSON/YAML.

## Building
Requires a Java Development Kit (JDK) and the Ateji PX compiler/IDE plugin. Ensure `apt-xpc` and `pxc` are in your system PATH.
```bash
pxc -cp . -d bin *.pxi
java -cp bin -Xbootclasspath/p:apt-xpc.jar CorrelatorMain
```

## Usage
Run the correlator with default simulated inputs:
```bash
java -cp bin -Xbootclasspath/p:apt-xpc.jar CorrelatorMain
```

## License
MIT License

## Disclaimer
This is a standalone demonstration of Ateji PX capabilities for parallel security event processing. Integrate with your existing SIEM or log aggregation pipeline by replacing the `SimulatedLogSource` with actual socket/file/HTTP listeners.
