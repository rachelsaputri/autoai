# Config Drift Audit Engine

A real-time configuration drift detection and audit logging service for the telemetry ecosystem.

## Features

- **Real-time Monitoring**: Watches configuration files for changes using file system event notifications.
- **Cryptographic Hashing**: Computes SHA-256 hashes to detect unauthorized modifications.
- **Immutable Audit Logs**: Appends security events to a persistent, tamper-evident log.
- **Auto-Remediation**: Optional automatic response to detected drift events.

## Directory Structure

- `src/main.rs`: Application entry point and engine initialization.
- `src/engine.rs`: Core drift detection logic and file system watcher.
- `src/models.rs`: Data structures for drift events and audit logs.
- `src/config.rs`: Configuration loading and validation.
- `src/patterns.rs`: Validation patterns for sensitive paths and critical files.

## Configuration

The engine can be configured via `config.json` in the project root:

```json
{
  "watch_directory": "/etc/telemetry",
  "auto_remediate": false,
  "log_level": "info",
  "baseline_store_path": "/var/lib/telemetry/baselines"
}
```

## Integration

This tool is designed to work with the `config_apply_manager` for automatic remediation. When drift is detected, it can trigger a reconciliation process to restore the configuration to its approved baseline.

## Building

```bash
cargo build --release
```

## Running

```bash
cargo run --release
```
