# Cel Formal Audit System

A production-grade, fully functional formal policy audit and autonomous compliance enforcement system built strictly using the Cel programming language.

## Overview

This tool implements a deterministic, high-precision workflow for formal policy auditing. It leverages Cel's expressive syntax and type-safe architecture to encode complex state invariants and performs rigorous verification through modular component composition and static analysis.

## Features

- **Formal Policy Definition**: Define security policies using Cel's expressive type system.
- **Automated Verification**: Rigorous verification through modular component composition.
- **Compliance Certificate Generation**: Machine-verifiable compliance certificates with exact type-inference results.
- **Policy Mapping**: Handles structured policy mapping for automated audit pipelines.
- **Robust Constraint Registry**: Maintains a robust constraint registry with comprehensive error handling and strict exit code management.
- **Compliance Reporting**: Outputs machine-readable compliance status updates.

## Architecture

- `main.cel`: The entry point that orchestrates the audit process, parses configuration, initializes the audit engine, and manages the overall workflow.
- `policy_auditor.cel`: Core module responsible for parsing policy definitions, extracting rules, and preparing them for verification.
- `compliance_verifier.cel`: Implements the logic for verifying system state against defined policies, calculating compliance scores, and generating reports.

## Building and Running

1. Ensure Cel compiler is installed.
2. Compile the project:
   ```bash
   ccel main.cel policy_auditor.cel compliance_verifier.cel -o cel_audit_system
   ```
3. Run the tool:
   ```bash
   ./cel_audit_system --config audit_config.cel.json
   ```

## Configuration

The tool expects a JSON configuration file to define the audit scope, policy locations, and output preferences.

## License

MIT
