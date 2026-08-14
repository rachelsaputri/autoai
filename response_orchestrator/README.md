# Response Orchestrator

A high-performance, Rust-based automated response engine designed to consume alerts from the `alert_dispatch_engine` and execute remediation actions with deterministic low latency.

## Features
- **Zero-Copy IPC**: Uses `postcard` and shared memory buffers to consume alerts from the `anomaly_detector`/`correlation_engine` pipeline without serialization overhead.
- **Deterministic Latency**: Async-first architecture with `tokio` ensures sub-millisecond response times for critical alerts.
- **Memory Safety**: Strict Rust ownership prevents race conditions when interacting with low-level system APIs (e.g., iptables, process signals).
- **Modular Action System**: Pluggable action handlers for network isolation, process termination, and session revocation.
- **Safety Interlocks**: Dry-run modes and confirmation workflows to prevent accidental infrastructure damage.

## Pipeline Integration
- **Input**: Consumes alerts via the high-speed IPC channel provided by `alert_dispatch_engine`.
- **Output**: Executes system commands or API calls to remediate threats.

## Safety
- All destructive actions require explicit configuration flags.
- Dry-run mode logs actions without execution.
- Role-based action limits defined in `config.rs`. 
