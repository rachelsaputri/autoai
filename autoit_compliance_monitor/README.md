# AutoIt Compliance Monitor

## Overview
`autoit_compliance_monitor` is a production-grade, fully functional system integrity and compliance monitoring utility built STRICTLY using the AutoIt programming language.

## Features
- **Continuous Monitoring:** Real-time checks on system registry keys, file integrity, and running processes.
- **Dynamic Policy Evaluation:** Evaluates system state against user-defined compliance rules leveraging AutoIt's native COM and system interaction capabilities.
- **Tamper-Proof Auditing:** Maintains robust, timestamped audit trails via robust logging mechanisms.
- **Concurrent Execution:** Handles multiple monitoring tasks efficiently using AutoIt's event model and threading mechanisms.
- **Configurable Policies:** Maintains a comprehensive, versioned policy configuration in INI and JSON formats.
- **Standardized Reporting:** Outputs compliance reports and alerts in JSON and INI formats for seamless enterprise integration.

## Structure
- `main_monitor.au3` - Primary execution entry point.
- `registry_watcher.au3` - Manages continuous monitoring of critical registry keys.
- `file_integrity_checker.au3` - Calculates and validates file hashes (SHA256) for system binaries.
- `process_monitor.au3` - Tracks running processes against allow/deny lists.
- `compliance_engine.au3` - Core logic for policy evaluation and violation detection.
- `audit_logger.au3` - Handles secure, tamper-proof logging of all events.
- `report_generator.au3` - Generates standardized compliance reports in JSON/INI.

## Requirements
- Windows OS (x86/x64)
- AutoIt v3 installed (for development/compilation)

## Compilation
Compile `main_monitor.au3` into a standalone executable:
`C:\Program Files (x86)\AutoIt3\AutoIt3.exe /AutoIt3_x64 /prod main_monitor.au3`

## License
Internal Enterprise Use Only
