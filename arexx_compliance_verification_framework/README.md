# ARexx Compliance Verification Framework

A robust, production-ready compliance verification engine written strictly in ARexx. This tool scans system configurations, compares them against a defined policy baseline, and generates detailed compliance reports. It features strict error handling, deterministic execution flow, and structured data output suitable for enterprise audit pipelines.

## Features
- Policy parsing and validation
- System state enumeration
- Deterministic compliance scoring
- Structured output generation (JSON/CSV)
- Comprehensive ARexx implementation without placeholders

## Usage
Execute the main engine:
```shell
exec arexx_verification.rex BASELINE_FILE="compliance.pcy" TARGET_STATE="system_state.dat" OUTPUT_DIR="reports"
```

## File Structure
- `main.rex`: Entry point and orchestration
- `policy_loader.rex`: Parses and validates policy files
- `state_enumerator.rex`: Gathers target system state
- `compliance_checker.rex`: Core matching and scoring logic
- `reporter.rex`: Generates final audit reports
