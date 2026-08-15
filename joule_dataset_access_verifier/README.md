# Joule Dataset Access Control Verifier

## Overview
The Joule Dataset Access Control Verifier is a specialized mainframe auditing tool designed to automate the verification of dataset allocation permissions and access controls. It scans mainframe datasets against defined security baselines to identify compliance deviations, unauthorized access attempts, and misconfigurations.

## Features
- **Automated Scanning**: Scans VSAM, PDSE, and sequential datasets for permission inconsistencies.
- **Baseline Comparison**: Compares current dataset attributes against a predefined security baseline configuration.
- **Compliance Reporting**: Generates detailed JSON and plain text reports highlighting critical, high, medium, and low severity issues.
- **Remediation Scripts**: Outputs JCL scripts to automatically fix common permission misconfigurations (e.g., correcting EXCLUDE/READ/WRITE permissions).

## Directory Structure
- `joule_dataset_access_verifier.jou`: Main execution script handling dataset traversal and baseline validation.
- `joule_config.jou`: Configuration file for defining security baselines, severity thresholds, and target dataset patterns.
- `joule_parser.jou`: Utility modules for parsing system datasets (e.g., IOR, ADRDSSU outputs) and interpreting access control lists.

## Usage
1. Ensure the mainframe environment variables are configured for the Joule runtime.
2. Run the verifier:
   ```bash
   joule joule_dataset_access_verifier.jou -config joule_config.jou -output ./audit_reports/
   ```
3. Review the generated compliance reports.
4. Apply the generated remediation JCL scripts after review and authorization.

## Security & Compliance
This tool is designed for authorized mainframe security administrators. It operates in read-only mode by default to prevent accidental data modification. Remediation scripts must be explicitly requested and approved before execution.

## License
Internal Use Only - Legacy Mainframe Security Audit Suite
