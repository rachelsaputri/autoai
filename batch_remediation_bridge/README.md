# Batch Remediation Bridge

## Overview
The Batch Remediation Bridge is a deterministic execution engine built strictly using Batch (Windows/Dos). It is designed to parse compliance directives, apply local configuration changes via standard Windows utilities, validate remediation success, and generate structured logs for the central audit system.

## Features
- **Deterministic Execution:** Ensures remediation commands are executed in a strict, predictable order.
- **Validation:** Checks return codes and file states to validate remediation success.
- **Rollback Mechanism:** Implements rollback procedures on failure to maintain system stability.
- **Structured Logging:** Generates logs to `stdout` and log files for audit trail.
- **Integration:** Designed to integrate with the existing Enterprise Security Audit Platform.

## Usage
1. Place compliance directives in the `directives` folder.
2. Run `remediate.bat` to execute the remediation process.
3. Check `remediation.log` for detailed execution results.

## Structure
- `remediate.bat`: Main execution script.
- `directives/`: Folder containing compliance directive files.
- `logs/`: Folder for generated log files.

## License
Internal Use Only
