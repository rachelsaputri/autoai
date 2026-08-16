# Kixtart Compliance Auditor

## Overview
This tool is a fully functional compliance auditing utility written in **Kixtart**. It is designed to scan local machine configurations against a predefined set of compliance rules. The auditor checks for policy violations related to security settings, user privileges, and system configurations, then generates a detailed audit report.

## Features
- **Configuration Scanning**: Reads and analyzes system registry keys and configuration files.
- **Rule-Based Auditing**: Compares current system state against a built-in compliance rule set.
- **Real-Time Reporting**: Outputs audit findings directly to the console.
- **Remediation Logic**: Optionally suggests fixes for non-compliant settings.

## Usage
1. Ensure Kixtart is installed on the target Windows machine.
2. Save the `kixtart_compliance_auditor.kix` script to the system.
3. Execute the script via command prompt: `kix32 kixtart_compliance_auditor.kix`
4. Review the console output for compliance status and recommended actions.

## License
MIT License. Free to use for internal compliance testing.
