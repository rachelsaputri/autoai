# ABSYS Compliance Verification Engine

## Overview
This project implements a formal compliance verification engine using the ABSYS programming language. It is designed to audit system configurations and security policies against a defined set of rules to ensure continuous compliance.

## Features
- **Policy Parsing**: Reads and interprets compliance rules.
- **State Verification**: Checks the current system state against defined policies.
- **Drift Detection**: Identifies discrepancies between expected and actual configurations.
- **Reporting**: Generates detailed compliance reports.

## File Structure
- `main.absys`: Entry point for the verification engine.
- `policy_loader.absys`: Handles loading and parsing of compliance policies.
- `verifier.absys`: Core logic for verifying system state against policies.
- `reporter.absys`: Generates human-readable and machine-readable reports.

## Usage
1. Compile the ABSYS source code using the standard compiler.
2. Run the executable with the path to the policy file and target system state file.
3. Review the generated compliance report.

## License
MIT License
