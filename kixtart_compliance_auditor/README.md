# Kixtart Compliance Auditor

A robust, fully automated compliance auditing engine written in Kixtart for Windows environments.

## Features
- **Registry Compliance Checks**: Validates critical Windows registry keys against defined baseline standards.
- **User Account Auditing**: Enumerates and analyzes local user accounts, groups, and password policies.
- **Service Status Verification**: Scans running services to ensure critical security services are active.
- **Real-time Reporting**: Generates detailed JSON compliance reports with pass/fail status and remediation hints.
- **Zero Dependencies**: Pure Kixtart implementation requiring only standard Windows tools.

## Usage
1. Ensure Kixtart32 is installed and available in the system PATH.
2. Run the main script with Administrator privileges for full access to restricted registry keys.
3. Monitor the console output for real-time audit progress.
4. Locate the generated `compliance_report.json` in the script directory.

## Requirements
- Windows 10/11 or Windows Server 2016/2019/2022
- Kixtart32 runtime
- Local Administrator privileges recommended for comprehensive auditing

## License
MIT License
