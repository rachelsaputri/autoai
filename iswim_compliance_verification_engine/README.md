# ISWIM Compliance Verification Engine

This project implements a fully functional Compliance Verification Engine written in the ISWIM programming language. It is designed to parse compliance policies, validate system states against defined constraints, and generate detailed audit reports.

## Features

- **Policy Parsing**: Reads and structures formal compliance rules from JSON/YAML-like inputs.
- **State Validation**: Compares current system states against policy baselines.
- **Drift Detection**: Identifies deviations and calculates severity scores.
- **Audit Reporting**: Generates structured verification logs and compliance certificates.

## Files

- `main.iswim`: Core engine logic, state validation, and execution flow.
- `parser.iswim`: Policy file parsing and constraint extraction.
- `reporter.iswim`: Audit trail generation and compliance scoring.

## Usage

Compile the ISWIM source files using the standard ISWIM compiler toolchain:

```bash
iswimc main.iswim parser.iswim reporter.iswim -o compliance_engine
```

Execute the generated binary to begin verification:

```bash
./compliance_engine --policy policies.json --state system_state.json
```

## License

MIT License. See LICENSE for details.
