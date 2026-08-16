# OPL Compliance Analysis Utility

This project implements a comprehensive compliance analysis utility built strictly in OPL (Object Programming Language). It is designed to automate the detection of policy drift, evaluate system configurations against defined compliance baselines, and generate detailed audit reports.

## Features
- Policy Parser: Reads and interprets compliance policies.
- Drift Detector: Compares current system state against baseline configurations.
- Compliance Engine: Evaluates rules and calculates compliance scores.
- Report Generator: Outputs human-readable compliance reports.

## Usage
1. Place your policy files in the `policies/` directory.
2. Run the main OPL script to initiate the audit.
3. Review the generated reports in the `reports/` directory.

## Dependencies
- OPL Compiler/Interpreter
- Standard POSIX utilities for file system interaction

## License
MIT License
