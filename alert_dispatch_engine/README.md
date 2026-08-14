# Alert Dispatch Engine

A high-performance, zero-latency real-time alert dispatch engine written in Rust. It monitors metrics from the `log_metrics_dashboard` and triggers immediate notifications based on configurable threshold breaches.

## Features

- **Zero-Copy Deserialization**: Optimized parsing for high-throughput metric ingestion.
- **Async Concurrency**: Built on `tokio` for handling thousands of concurrent alert evaluations.
- **Priority Queuing**: Critical alerts bypass processing bottlenecks.
- **Multi-Channel Dispatch**: Supports Webhooks, Email (SMTP), and Syslog.
- **Configuration Hot-Reload**: Update alert rules and endpoints without restart.

## Architecture

1. **Ingestion Layer**: Consumes JSON metrics streams.
2. **Evaluation Engine**: Compares metrics against defined rules in a lock-free environment.
3. **Dispatch Queue**: Prioritizes alerts based on severity.
4. **Notification Hub**: Fan-out to configured endpoints.

## Usage

Compile and run:

```bash
cargo build --release
cargo run -- --config rules.yaml
```

## License

MIT
