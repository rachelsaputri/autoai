# Mainframe Configuration Auditor

A PL/B-based tool designed to audit IBM mainframe system configurations, analyze JCL parameters, and detect security policy drift.

## Overview
This tool leverages the structured programming capabilities of PL/B to scan system datasets, parse JCL members, and validate configuration parameters against a defined security baseline.

## Features
- **JCL Analysis**: Parses and validates Job Control Language datasets for compliance.
- **Parameter Drift Detection**: Compares current system parameters against a secure baseline.
- **Structured Reporting**: Generates audit reports in a format suitable for enterprise compliance logging.

## Usage
The `main.plb` file contains the core logic. It requires access to mainframe datasets which must be mounted or simulated in a test environment.

## Dependencies
- PL/B Compiler Environment (Mainframe)
- Access to System JCL and Configuration Datasets
