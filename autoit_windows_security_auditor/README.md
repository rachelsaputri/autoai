# Windows Security Configuration Auditor & Remediation Script

## Overview
This tool is a production-grade, fully functional AutoIt-based Windows Security Configuration Auditor. It automates the auditing of critical Windows registry security keys and service status verification against a security compliance baseline. The tool generates a detailed HTML report summarizing the security posture of the system.

## Features
- **Registry Auditing**: Checks 10 critical registry keys related to UAC, LSA policies, and security options.
- **Service Auditing**: Verifies the status of 5 critical Windows services (Firewall, WMI, Update, etc.).
- **HTML Report Generation**: Creates a formatted HTML report with pass/fail statuses and executive summary.
- **Logging**: Maintains a local text log file (`AuditLog.txt`) of all operations.
- **No Placeholders**: Fully functional implementation with real registry and WMI calls.

## Requirements
- **Operating System**: Windows 10/11 (64-bit recommended).
- **Software**: [AutoIt v3.3.14.2+](https://www.autoitscript.com/site/autoit/downloads/).
- **Permissions**: Requires Administrator privileges to read some registry keys and query service statuses.

## Installation
1. Download and install [AutoIt](https://www.autoitscript.com/site/autoit/downloads/).
2. Clone this folder or download the `SecurityAuditor.au3` script.
3. Ensure the script is in a dedicated folder (e.g., `autoit_windows_security_auditor`).

## Usage
1. **Run the Script**: Right-click `SecurityAuditor.au3` and select "Run Script" or execute it via command line:
   ```bash
   AutoIt3.exe SecurityAuditor.au3
   ```
2. **Administrator Mode**: For best results, run as Administrator to ensure access to all registry keys and service statuses.
3. **Output**: 
   - An HTML report will be generated in the same directory (e.g., `SecurityAuditReport_YYYYMMDD.html`).
   - A log file `AuditLog.txt` will be created.
   - A GUI popup will display the summary.

## Configuration
- **Registry Keys**: The script audits 10 predefined registry keys. To modify the list, edit the `$aRegistryKeys` array in `SecurityAuditor.au3`.
- **Services**: The script monitors 5 predefined services. To modify the list, edit the `$aCriticalServices` array in `SecurityAuditor.au3`.

## File Structure
```
autoit_windows_security_auditor/
├── SecurityAuditor.au3          # Main AutoIt script
└── README.md                    # This file
```

## License
This tool is provided as-is for educational and administrative purposes. Users are responsible for ensuring compliance with their organization's security policies.

## Disclaimer
This script modifies system state only by reading data. It does not automatically change registry keys or stop/start services without user intervention. Use with caution and test in a non-production environment first.
