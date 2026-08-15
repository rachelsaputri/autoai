# ATS Binary Integrity Monitor

A production-grade, low-level binary analysis and integrity monitoring utility built strictly in ATS (ATS2).

## Overview

This tool provides comprehensive static and dynamic binary analysis capabilities. It is designed to parse executable formats, verify memory layouts, compute cryptographic hashes for integrity tracking, and export structured audit logs for compliance and CI/CD pipelines.

## Features

- **Static Binary Parsing**: Extracts headers, sections, and symbols from ELF and Mach-O formats.
- **Integrity Monitoring**: Computes SHA-256 hashes for individual binary sections and verifies them against known baselines.
- **Compliance Logging**: Generates structured audit logs in JSON and XML formats suitable for enterprise security reporting.
- **Formal Verification Ready**: Written in ATS to leverage dependently-typed safety and low-level memory control.

## Building

Ensure you have the ATS2 compiler (`patscc`) and Make installed.

```bash
make clean
make
```

## Usage

```bash
./ats_binary_integrity_monitor <path_to_binary> [--format json|xml] [--baseline <path_to_baseline>]
```

## Project Structure

- `src/`: Core ATS source modules
- `src/parsing.dats`: ELF/Mach-O header and section parsers
- `src/integrity.dats`: Cryptographic hashing and integrity verification logic
- `src/reporting.dats`: JSON and XML log generation
- `src/main.dats`: Entry point and CLI argument handling
- `Makefile`: Build configuration
- `README.md`: This file

## License

Proprietary / Internal Use Only
