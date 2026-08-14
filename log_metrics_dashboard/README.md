# Log Metrics Dashboard

This module provides a high-performance, real-time log metrics aggregator and dashboard generator. It is built using Rust to ensure zero-latency metric extraction and high-concurrency aggregation from processed logs.

## Features

- **Zero-Latency Processing:** Leveraging Rust's performance characteristics to handle high-volume log streams.
- **High-Concurrency Aggregation:** Uses async/await and thread pools for efficient parallel processing.
- **Comprehensive Metrics:** Extracts key metrics such as error rates, request latency, and status code distributions.
- **Dashboard Generation:** Outputs structured data suitable for frontend visualization or CLI dashboards.

## Architecture

1. **Log Ingestion:** Reads processed logs from stdin or files.
2. **Metric Extraction:** Parses log entries to extract relevant fields (timestamp, level, status, duration, etc.).
3. **Aggregation Engine:** Groups and aggregates metrics in real-time using concurrent data structures.
4. **Output Formatter:** Formats the aggregated metrics into a structured JSON or Protobuf format for dashboard consumption.

## Usage

### Prerequisites

- Rust 1.70+ installed.
- `cargo` package manager.

### Building

```bash
cargo build --release
```

### Running

Run the aggregator on a log file:

```bash
cargo run --release -- ../processed_logs.json
```

Or pipe processed logs from stdin:

```bash
cat processed_logs.json | cargo run --release
```

### Output

The tool outputs a JSON object containing the aggregated metrics:

```json
{
  "total_requests": 1500,
  "error_rate": 0.02,
  "avg_latency_ms": 45.5,
  "p99_latency_ms": 120.0,
  "status_codes": {
    "200": 1400,
    "404": 50,
    "500": 50
  }
}
```

## License

MIT
