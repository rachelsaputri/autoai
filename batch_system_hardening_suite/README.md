# Batch System Hardening Suite

## Overview
The `batch_system_hardening_suite` is a production-grade, fully functional Windows-based security baseline enforcer implemented strictly in Batch (Windows/Dos). This tool is designed to audit Windows environments, detect non-compliant settings against strict security baselines, and execute safe remediation actions across legacy and modern Windows infrastructure.

## Features
- **Configuration Auditing**: Scans Windows configuration files, registry keys, and system policies to identify deviations from security baselines.
- **Registry Policy Enforcement**: Automatically applies registry-based security policies to harden the system.
- **Legacy API Integration**: Compatible with legacy Windows APIs and systems, ensuring broad applicability.
- **Automated Remediation**: Identifies non-compliant settings and executes predefined remediation scripts to resolve issues.
- **Compliance Reporting**: Generates detailed compliance reports highlighting detected issues and remediation actions taken.

## Prerequisites
- Windows Operating System (NT-based, including Windows 10, Windows Server 2019, etc.)
- Administrator privileges are required to perform registry modifications and system auditing.

## Usage
1. **Run as Administrator**: Ensure the script is executed with administrator privileges.
2. **Initial Audit**: Run the main script to perform a comprehensive audit of the system's security posture.
3. **Review Reports**: Check the generated compliance reports to identify non-compliant settings.
4. **Remediate**: Execute remediation scripts to apply security policies and fix identified issues.

## Structure
- `main.bat`: Entry point for the hardening suite.
- `audit_configs.bat`: Batch script for auditing system configurations.
- `enforce_policies.bat`: Batch script for enforcing registry-based security policies.
- `remediate_issues.bat`: Batch script for automated remediation of non-compliant settings.
- `generate_reports.bat`: Batch script for generating compliance reports.
- `README.md`: This file.

## Disclaimer
Use this tool at your own risk. Ensure you have a backup of your system and registry before running any automated remediation scripts.

## License
This project is licensed under the MIT License. See the LICENSE file for more information.
