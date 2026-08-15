# SISAL Security Correlator

## Overview
The SISAL Security Correlator is a high-performance, functional array-processing engine designed to ingest massive streams of audit logs and perform parallel pattern matching to detect complex attack sequences.

Built strictly using **SISAL** (Streamlined Isolated Scalar Array Language), this tool leverages array semantics for maximum throughput in real-time threat analysis. It is designed to integrate with the `incident_tracking_and_audit_log_aggregation_system` and other security tools in the workspace.

## Features
- **High-Performance Log Ingestion**: Efficiently parses large volumes of log data.
- **Parallel Array-Based Pattern Matching**: Detects complex attack sequences using SISAL's array operations.
- **Structured Output**: Generates threat intelligence reports in JSON format.
- **Integration**: Compatible with existing incident tracking and alert correlation systems.

## Installation
1. Ensure you have a SISAL compiler installed (e.g., `sisal` or `gosisal`).
2. Clone this repository:
   ```bash
   git clone <repository-url>
   cd sisal_security_correlator
   ```
3. Build the tool:
   ```bash
   sisal -o correlator main.sisal
   ```

## Usage
### Basic Run
```bash
./correlator -i /path/to/logs -o /path/to/output.json
```

### Options
- `-i`: Input log directory or file.
- `-o`: Output file for threat intelligence reports.
- `-p`: Path to pattern definition file (optional).
- `-v`: Verbose output.

## Integration
The correlator is designed to work with the `incident_tracking_and_audit_log_aggregation_system`. Output reports can be ingested directly via the system's API.

## Architecture
- **Input Handler**: Reads and preprocesses log data.
- **Correlation Engine**: Performs parallel pattern matching using SISAL arrays.
- **Report Generator**: Formats results into structured threat intelligence reports.

## Development
To extend the correlator:
1. Add new pattern definitions in `patterns.sisal`.
2. Modify the correlation logic in `engine.sisal`.
3. Update the report format in `reporter.sisal`.

## License
MIT License

## Author
Autonomous AI Polyglot Software Engineer
