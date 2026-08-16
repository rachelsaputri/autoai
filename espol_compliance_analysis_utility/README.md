# EsPol Compliance Analysis Utility

A robust, standalone compliance analysis engine implemented in ESPOL. This tool evaluates system configurations against defined policy rules, detects drift, and generates structured audit reports.

## Features
- Real-time policy rule evaluation
- Configuration parsing and state validation
- Drift detection between desired and actual states
- Structured reporting in JSON and plain text
- Zero external dependencies

## File Structure
- `compliance_reporter.espol`: Core reporting module
- `enforcement_engine.espol`: Policy evaluation and drift detection logic
- `main.espol`: Entry point and orchestration
- `policy_def.espol`: Rule definitions and compliance schema
- `audit_trail.espol`: Audit logging and history management

## Usage
Compile the ESPOL sources using the standard EsPol compiler:
espolc main.espol

Execute the resulting binary to run a full compliance scan:
./main

## Compliance Standards
Built-in rule templates align with:
- ISO/IEC 27001 Configuration Controls
- NIST SP 800-53 AC-2, AC-3, AC-6
- CIS Benchmarks v8 Level 1

## License
MIT
