# System Orchestrator

## Overview
This bash-based tool implements an automated security service orchestration and log rotation manager for the telemetry ecosystem. It is designed to manage daemon lifecycles, configure centralized logging pipelines, handle secure archival of audit trails, and validate system hardening settings to ensure continuous compliance and operational stability.

## Features
- **Daemon Lifecycle Management**: Start, stop, restart, and monitor background services with robust signal handling and PID management.
- **Centralized Logging Pipelines**: Configures and routes logs from multiple telemetry components into a unified, structured format.
- **Secure Archival**: Implements GZIP compression and cryptographic hashing for audit trail archival, ensuring data integrity.
- **System Hardening Validation**: Checks critical sysctl parameters, firewall rules, and service states against a compliance baseline.
- **Automated Healthchecks**: Periodic heartbeat monitoring with alerting fallback for critical failures.

## Directory Structure
```
system_orchestrator/
├── main.sh          # Entry point and command dispatcher
├── service_manager.sh # Handles daemon start/stop/status/restart
├── log_pipeline.sh    # Configures log rotation and centralized ingestion
├── archival.sh        # Securely compresses and hashes old logs
├── hardening.sh       # Validates system security parameters
├── healthcheck.sh     # Monitors service status and resource usage
├── config.env         # Environment variables and defaults
└── README.md          # This file
```

## Installation & Usage
1. Clone this folder into your workspace.
2. Make scripts executable: `chmod +x *.sh`
3. Edit `config.env` to match your environment paths and service names.
4. Run the orchestrator: `./main.sh [start|stop|status|rotate|archive|hardening|healthcheck]`

## Configuration
- `config.env`: Define `SERVICE_LIST`, `LOG_DIR`, `ARCHIVE_DIR`, `SYSCTL_BASELINE`, and `ALERT_EMAIL`.
- Service definitions are comma-separated PIDs or systemd unit names.
- Log rotation follows a 7-day rolling window with cryptographic integrity checks.

## Compliance & Security
- All archival operations use `sha256sum` for integrity verification.
- Hardening checks against CIS Benchmark baseline for Linux systems.
- Restricts file permissions to `700` for sensitive configuration and logs.

## Maintenance
- Deploy as a cron job or systemd timer for automated daily healthchecks and log rotation.
- Monitor orchestration logs at `$LOG_DIR/orchestrator.log` for pipeline status and errors.

## License
Internal Use Only - Enterprise Security & Telemetry Ecosystem
