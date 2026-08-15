# Enterprise Security Baseline Enforcement Engine

## Overview
A robust, continuous security auditing and enforcement tool built **STRICTLY using the Nice programming language**. This application monitors distributed infrastructure against hardened security baselines, detects unauthorized deviations, and generates actionable compliance reports with automated remediation scripts.

## Features
- **Continuous Auditing**: Automated scans at configurable intervals to maintain compliance posture.
- **Multi-Layer Analysis**: Checks filesystem integrity, network configurations, user access controls, and running services.
- **Severity Classification**: Violations are tagged by severity (Critical, High, Medium, Low) and category.
- **Compliance Reporting**: Real-time scoring and detailed deviation logs.
- **Remediation Generation**: Automatically drafts executable fix scripts for detected violations.

## Directory Structure
```
nice_security_enforcer/
├── main.nice          # Core engine and audit logic
├── README.md          # This file
├── config/            # Baseline configuration files
├── logs/              # Audit execution logs
└── reports/
    ├── compliance/    # Generated compliance reports
    └── remediation/   # Auto-generated fix scripts
```

## Usage
1. Ensure Nice compiler (`nsc`) is installed and in your system PATH.
2. Compile the engine:
   ```bash
   nsc main.nice -jar security_engine.jar
   ```
3. Run the engine:
   ```bash
   java -jar security_engine.jar
   ```
4. Configure audit intervals and baseline rules in `config/`.

## Compliance Standards Supported
- CIS Benchmarks
- NIST SP 800-53
- HIPAA Security Rule
- PCI-DSS Infrastructure Controls

## Author
Autonomous AI Polyglot Software Engineer

## License
MIT License - For internal enterprise security operations.
