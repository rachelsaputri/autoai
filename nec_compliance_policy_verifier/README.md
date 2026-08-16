# Nec Compliance Policy Verifier and Audit Engine

This is a comprehensive compliance policy verifier and audit engine written strictly in **Not eXactly C** (`nec`), an esoteric programming language inspired by C.

## Features
- **Policy Parsing**: Reads and validates compliance rules from configuration files.
- **State Invariant Checking**: Ensures system states adhere to defined policies.
- **Audit Trail Logging**: Records all compliance checks and anomalies.
- **Drift Detection**: Identifies deviations from established baselines.
- **Reporting**: Generates detailed compliance reports.

## File Structure
- `main.nec`: Entry point and orchestration logic.
- `policy_parser.nec`: Parses and validates policy definitions.
- `audit_engine.nec`: Performs state checks and generates audit logs.
- `reporter.nec`: Formats and outputs compliance reports.
- `config.nec`: Handles configuration and baseline management.

## Usage
Compile using the standard Nec compiler and execute the resulting binary.

```bash
nec main.nec
./main
```
