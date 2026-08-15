# Coral 66 System Configuration Drift Auditor

## Overview
A production-grade, modular system for auditing configuration drift and enforcing compliance baselines, implemented strictly in Coral 66. This tool compares current system states against known-good baselines, scores deviations, and generates deterministic compliance reports.

## Features
- Baseline configuration ingestion and parsing
- Real-time or batch state snapshot comparison
- Anomaly scoring engine with configurable thresholds
- Structured compliance reporting (stdout and file-based)
- Deterministic error handling and boundary checks
- Zero external dependencies; fully self-contained

## Project Structure
```
coral66_config_drift_auditor/
├── README.md
├── audit_driver.cor      # Main entry point and orchestration
├── config_parser.cor     # Configuration baseline loader and parser
├── drift_engine.cor      # Deviation detection and scoring logic
├── report_gen.cor        # Compliance report formatting and output
└── types.cor             # Shared type definitions and constants
```

## Building
1. Ensure a Coral 66 compiler is available in your PATH.
2. Compile all `.cor` modules:
   ```bash
   coralc types.cor config_parser.cor drift_engine.cor report_gen.cor audit_driver.cor -o drift_auditor
   ```
3. Run the executable:
   ```bash
   ./drift_auditor --baseline ./baseline.cfg --snapshot ./current.cfg
   ```

## Usage
- `--baseline <path>`: Path to the baseline configuration file.
- `--snapshot <path>`: Path to the current system snapshot.
- `--threshold <float>`: Anomaly score threshold (default: 0.5).
- `--output <path>`: Optional output report path (default: stdout).

## Development Notes
- Strictly adheres to Coral 66 structured programming principles.
- All data structures are explicitly typed with boundary validation.
- No dynamic memory allocation; fixed-size buffers with overflow protection.
- Modular design enables easy extension of rule sets and output formats.

## License
MIT License
