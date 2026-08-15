# Pascal Formal Policy Verifier

## Overview
The **Pascal Formal Policy Verifier** is a robust, static analysis tool built using Object Pascal. It is designed to parse, validate, and verify formal policy specifications against a set of system invariants. This tool ensures logical consistency, detects contradictions, and generates comprehensive compliance verification reports.

## Features
- **Policy Parser**: Reads formal policy definitions from structured text files.
- **Consistency Checker**: Performs static analysis to detect logical contradictions and redundancies.
- **Invariant Verifier**: Validates policy constraints against defined system invariants.
- **Report Generator**: Produces detailed reports in structured text format for integration into CI/CD pipelines or audit workflows.

## Project Structure
```
pascal_formal_policy_verifier/
├── main.pas
├── policy_parser.pas
├── consistency_checker.pas
├── invariant_verifier.pas
├── report_generator.pas
├── types.pas
└── README.md
```

## Usage
1. Ensure you have an Object Pascal compiler (e.g., Free Pascal Compiler).
2. Compile the project using `fpc main.pas`.
3. Run the executable with a policy file as an argument: `./main policy.txt`.

## Dependencies
- Free Pascal Compiler (FPC) 3.2.0 or later.
- Standard RTL units only (no external dependencies).

## License
MIT License
