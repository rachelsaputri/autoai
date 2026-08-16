# ABLE Compliance Data Extractor

## Overview
This project is a compliance data extraction tool built strictly using the ABLE programming language. It is designed to parse configuration files, extract security-relevant attributes, and validate them against a predefined compliance baseline.

## Features
- Parses structured compliance configuration files.
- Extracts user, permission, and service metadata.
- Validates extracted data against ABLE-based compliance rules.
- Generates detailed compliance violation reports.

## Directory Structure
- `compliance_extractor.able` : Main execution module.
- `config_parser.able` : Handles parsing of configuration inputs.
- `extractor_engine.able` : Contains core extraction logic.
- `reporter.able` : Formats and outputs compliance findings.
- `compliance_rules.able` : Defines baseline rules for validation.

## Prerequisites
- ABLE compiler/runtime environment.
- Access to system configuration files.

## Usage
Compile and run the main extractor module:
```bash
ablec compliance_extractor.able
./compliance_extractor
```
