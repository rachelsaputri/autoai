# macOS Security Compliance Auditing Tool

## Overview
This is a comprehensive, native AppleScript-based tool designed to automate and verify security compliance on macOS systems. It checks critical system configurations against industry-standard security baselines, generating detailed reports for system administrators and security auditors.

## Features
- **Automated Security Checks**: Verifies FileVault, Firewall, Gatekeeper, SIP, and update policies.
- **Detailed Reporting**: Generates timestamped compliance reports saved to the Desktop.
- **Logging**: Maintains a persistent audit log in the `~/Library/Logs` directory.
- **Native Execution**: Runs entirely using macOS native utilities (`do shell script`, `System Events`, `security`, `spctl`, `csrutil`, etc.).
- **Zero Dependencies**: Requires no third-party packages or external frameworks.

## Requirements
- macOS 10.15 (Catalina) or newer
- Administrator privileges (sudo/root access may be required for some checks)
- AppleScript 2.0+ (Standard on macOS)

## Installation
1. Navigate to the `macos_compliance_auditor` directory.
2. Open `main.scpt` using the AppleScript Editor or double-click to execute.
3. Grant necessary permissions in System Preferences > Security & Privacy > Full Disk Access when prompted.

## Usage
1. **Run the Script**: Double-click `main.scpt` or run via terminal:
   ```bash
   osascript macos_compliance_auditor/main.scpt
   ```
2. **Review Results**: 
   - A dialog box will appear summarizing the audit status.
   - A text report will be saved to the Desktop named `compliance_report.txt`.
   - Execution logs are stored at `~/Library/Logs/macos_compliance_auditor.log`.

## Configuration
You can modify the default paths at the top of `main.scpt`:
```applescript
set policyPath to POSIX file (path to desktop as text) & ":security_policies.json"
set reportOutputPath to POSIX file (path to desktop as text) & ":compliance_report.txt"
set logPath to POSIX file (path to library as text) & "Logs:macos_compliance_auditor.log"
```

## Security Checks Implemented
| Check ID | Description | Status |
|----------|-------------|--------|
| `FV-01`  | FileVault Full Disk Encryption | Enabled/Disabled |
| `FW-01`  | System Firewall Status | Enabled/Disabled |
| `GP-01`  | Gatekeeper Application Quarantine | Enabled |
| `AU-01`  | Automatic Security Update Checks | Enabled/Disabled |
| `RL-01`  | Remote Login (SSH) Status | Enabled/Disabled |
| `SIP-01` | System Integrity Protection | Enabled/Disabled |
| `PW-01`  | Password Complexity Policies | Configured |
| `LA-01`  | Admin Account Lockout Policy | Enforced |

## Error Handling
The script includes robust error handling for privilege denials, missing utilities, and permission issues. All errors are logged with timestamps and displayed in a user-friendly alert.

## License
This tool is provided as-is for internal compliance auditing purposes. Modify and distribute according to your organization's policies.

## Author
Autonomous AI Polyglot Software Engineer

## Version
1.0.0
