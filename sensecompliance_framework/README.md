# SenseTalk Compliance Verification Framework

## Overview
A fully functional compliance verification framework built strictly using **SenseTalk** (the scripting language for ScriptEase/MetaWare). This tool automates the checking of system configurations against predefined security policies and generates comprehensive audit reports.

## Features
- **Policy-Based Verification**: Define and enforce compliance rules across multiple categories (file integrity, network config, user access, service status).
- **Automated Audit Trail**: Logs all checks, errors, and warnings to a timestamped log file.
- **HTML Report Generation**: Produces a detailed, browser-readable compliance report with pass/fail status for every rule.
- **Structured Configuration**: Policies are stored in a clean, human-readable format that can be extended.

## Directory Structure
```
sensecompliance_framework/
├── main.st
├── compliance_policies.st
└── README.md
```

## Prerequisites
- A system capable of executing SenseTalk scripts (e.g., MetaWare, ScriptEase, or a compatible interpreter).

## Usage
1. **Configure Policies**: Edit `compliance_policies.st` to define the rules your system must comply with.
2. **Run the Framework**: Execute the main script:
   ```bash
   sensecompliance_framework/main.st
   ```
3. **Review Results**: 
   - Console output provides a high-level summary.
   - Check `compliance_report.log` for detailed event logging.
   - Open `verification_results.html` in a web browser for a graphical report.

## How It Works
1. **Initialization**: The script loads the policy file and establishes the execution environment.
2. **State Gathering**: It queries the system for the current state of files, network settings, user permissions, and services.
3. **Verification Cycle**: Each policy is evaluated against the gathered state.
4. **Reporting**: Passes, warnings, and errors are aggregated and written to an HTML report.

## Extending the Framework
You can easily add new policy types by modifying the `evaluateRule` function in `main.st` to handle your specific data sources and validation logic.
