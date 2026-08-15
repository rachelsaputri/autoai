# Enterprise Security Policy Compliance Auditor & Remediation Orchestrator

## Overview
This is a production-grade, fully functional AutoHotkey-based tool designed for automated Enterprise Security Policy Compliance Auditing. It leverages AutoHotkey's native Windows system administration capabilities to perform real-time registry and file system policy validation, cryptographic integrity verification, and structured audit reporting for SIEM ingestion.

## Features
- **Automated Policy Validation**: Checks critical Windows registry keys and system files against predefined security baselines.
- **Cryptographic Integrity Verification**: Computes SHA256 hashes of essential system binaries to detect unauthorized modifications.
- **Parallel Event Polling**: Runs in dedicated background threads to ensure continuous monitoring without GUI lag.
- **Structured Reporting**: Outputs findings in both JSON and CSV formats, ready for immediate SIEM ingestion.
- **Real-time GUI Monitoring**: Lightweight Windows Forms-style interface for system administrators to track compliance status and trigger manual reports.

## Prerequisites
- **Operating System**: Windows 10/11 or Windows Server 2016/2019/2022 (64-bit recommended)
- **AutoHotkey**: v2.0 or later (Ensure `AutoHotkey64.exe` is in your system PATH)
- **Permissions**: Must be executed as Administrator to access restricted registry paths and system directories.

## Project Structure
```
autohotkey_compliance_orchestrator/
├── ComplianceAuditor.ahk      # Main executable script containing core logic
├── Logs/                      # Auto-generated directory for audit findings
│   ├── audit_TIMESTAMP.json
│   ├── final_report.json
│   └── final_report.csv
└── README.md                  # This documentation file
```

## Installation & Usage
1. Download or clone the repository contents into a new directory.
2. Open Command Prompt as Administrator.
3. Navigate to the `autohotkey_compliance_orchestrator` directory.
4. Execute the main script:
   ```cmd
   AutoHotkey64.exe ComplianceAuditor.ahk
   ```
5. The GUI will launch. Click "Generate Report" to force a complete JSON/CSV dump. The tool runs automatically in the background.

## Configuration
Edit `GLOBAL_CONFIG` at the top of `ComplianceAuditor.ahk` to customize:
- `PolicyRegistryPath`: The registry key to audit.
- `ComplianceLogDir`: Directory for storing audit logs.
- `HashAlgorithm`: Cryptographic algorithm for file hashing (e.g., "SHA256", "MD5").
- `PollInterval`: Milliseconds between background audit cycles.
- `OutputFormats`: Array of string formats to generate.

## Security & Compliance Notes
- This tool performs read-only operations on system policies. It does not automatically remediate vulnerabilities to prevent accidental system instability, though the architecture supports seamless remediation bridge integration.
- All logs are stored locally with UTC timestamps. Ensure local log rotation policies are enforced.
- The SIEM ingestion endpoint is structured for direct HTTP POST implementation. Uncomment the `WinHttpRequest` block in the source code to activate network transmission.

## License
MIT License. Use freely in enterprise security operations.
