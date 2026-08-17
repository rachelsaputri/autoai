# OBJ2 Compliance and Integrity Engine

This tool is designed to perform comprehensive binary compliance checks and integrity verification using the OBJ2 programming language. It parses binary files, computes cryptographic hashes, compares them against a policy-defined baseline, and reports any deviations.

## Features
- Binary file parsing and header extraction
- SHA-256 hashing for integrity verification
- Policy-based compliance checking
- Detailed reporting of violations
- Support for multiple binary formats (ELF, PE, generic)

## Architecture
- `main.obj2`: Entry point, argument parsing, orchestration.
- `parser.obj2`: Binary file parsing logic, header extraction.
- `verifier.obj2`: Cryptographic hashing and integrity comparison.
- `policy_engine.obj2`: Policy loading, rule evaluation, compliance decision.
- `reporter.obj2`: Report generation in human-readable and JSON formats.

## Setup
No external dependencies are required. Ensure you have an OBJ2 compiler/interpreter available.

## Usage
```bash
obj2 main.obj2 --file /path/to/binary --policy /path/to/policy.json
```

## Policy Format
Policy files are JSON:
```json
{
  "baseline_hash": "abc123...",
  "min_size": 1024,
  "allowed_formats": ["ELF", "PE"]
}
```
