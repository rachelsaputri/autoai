# Correlation Engine

A high-throughput, low-latency real-time log correlation and anomaly detection engine written in Rust.

## Overview

This engine is designed to ingest streaming logs from the `log_metrics_dashboard` and contextual data from the `alert_dispatch_engine`. It automatically identifies root causes and complex multi-stage attack patterns by correlating events across time windows and pattern matching.

## Architecture

- **Ingestion**: Asynchronous buffer management via `tokio`.
- **Pattern Matching**: Parallel regex matching using `rayon` and optimized `regex` crate.
- **Scoring**: Statistical anomaly scoring with history tracking.
- **Correlation**: Event clustering to detect multi-stage attacks.
- **Dispatch**: Prepared interface for sending high-fidelity alerts to downstream systems.

## Key Features

- **Zero-Copy Processing**: Minimizes allocations during stream parsing.
- **Fearless Concurrency**: Safe parallel processing of log batches.
- **Extensible Patterns**: Regex-based pattern registry with configurable weights.
- **Anomaly Scoring**: Weighted scoring system based on frequency and severity.

## Getting Started

### Prerequisites

- Rust 1.70+

### Build

```bash
cargo build --release
```

### Run

```bash
cargo run --release
```

### Configuration

Edit `config.toml` (or implement config loading) to adjust:

- `ingestion_interval_ms`: Time between processing batches.
- `window_size_secs`: Time window for correlation.
- `anomaly_threshold`: Minimum score to trigger alerts.
- `max_memory_mb`: Memory limit for the engine.

## API

The engine exposes methods for:

- `ingest_events`: Add logs to the processing buffer.
- `process_batch`: Trigger pattern matching and anomaly detection.
- `dispatch_alert`: Internal method to send alerts to `alert_dispatch_engine`.

## Performance

Optimized for high-throughput environments:

- **Pattern Matching**: O(N) per batch with parallel reduction.
- **Memory Usage**: Bounded by configuration with LRU-like cleanup.
- **Latency**: Sub-millisecond event processing under load.

## License

MIT
