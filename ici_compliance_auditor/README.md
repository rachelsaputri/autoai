# ICI Compliance Auditor

## Overview
A centralized policy compliance auditor built strictly in ICI. Continuously validates system configurations against security baselines and outputs automated reconciliation directives.

## Features
- Baseline configuration parsing and comparison
- Real-time drift detection
- Automated reconciliation report generation
- Structured logging of audit events
- No external dependencies beyond standard POSIX libraries

## Directory Structure
```
ici_compliance_auditor/
├── main.ici        # Core audit engine and reconciliation logic
├── README.md       # This documentation file
└── reconciliation_report.txt # Generated output (created at runtime)
```

## Build & Run
```bash
ici main.ici
./main
```

## Configuration
The auditor expects a baseline configuration file at `/etc/compliance/base`. Each line should follow the `key=value` format.

## Security Considerations
- Run with appropriate system privileges to read configuration files
- Reports are written to the current directory with standard permissions
- All sensitive operations are logged to `/var/log/compliance_auditor.log`

## License
Internal Use Only
