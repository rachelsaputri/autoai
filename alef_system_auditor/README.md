# Alef System Auditor

A lightweight, deterministic process auditor and telemetry gateway built strictly using the **Alef** programming language.

## Overview

The `alef_system_auditor` module is designed to capture low-level system metrics, detect unauthorized process injections, and identify privilege escalations. It serves as a high-performance auditing layer that integrates with the existing security orchestration workflows in this repository, specifically streaming alerts to the `alert_correlation_persistence` and `incident_tracking_and_audit_log_aggregation_system` modules.

Alef, originally developed by Bell Labs (Brian Kernighan), provides strict type checking and deterministic behavior, making it an ideal choice for critical system security monitoring where predictability and low-level hardware access are paramount.

## Features

- **Process Injection Detection**: Monitors critical system processes for signs of memory manipulation or unauthorized DLL/so injection.
- **Privilege Escalation Monitoring**: Tracks changes in process permissions and flags suspicious privilege gains.
- **Low-Level Telemetry**: Streams system metrics (CPU, memory, open file descriptors) with minimal overhead.
- **Integration Ready**: Designed to pipe output directly into the workspace's incident tracking and alert correlation pipelines.

## Directory Structure

- `README.md`: This file.
- `auditor.af`: Core Alef source file containing the logic for system auditing and telemetry.

## Installation & Usage

### Prerequisites

Ensure you have an Alef compiler environment set up (typically associated with Plan 9 or legacy Unix systems).

### Compilation

```bash
afl -o alef_auditor auditor.af
```

### Running

```bash
./alef_auditor --target /var/log/security --stream true
```

## Integration

### Alert Correlation Persistence

The auditor outputs JSON-formatted alerts to stdout when the `--stream` flag is enabled. You can pipe this directly to the persistence module:

```bash
./alef_auditor --stream true | ./alert_correlation_persistence/process_alerts.py
```

### Incident Tracking

For manual review or batch processing, save the audit log to the incident tracking directory:

```bash
./alef_auditor --log /incident_tracking_and_audit_log_aggregation_system/alef_audit.log
```

## Security Model

This tool operates with minimal privileges by default. To capture deep system metrics, it requires elevated permissions (`root` or equivalent). It is designed to be read-only regarding process memory unless an anomaly is detected, in which case it triggers an immediate alert to the orchestration engine.

## License

MIT License
