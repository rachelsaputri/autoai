# Log Analyzer

A high-performance log file analyzer built with Rust.

## Features

- **High Throughput:** Async I/O for processing large log files.
- **Efficient Parsing:** Leverages regex for flexible log format matching.
- **Memory Safety:** Rust ensures memory safety without a garbage collector.
- **Configurable:** Supports multiple log formats and output styles.

## Usage

1. Build the project:
   ```bash
   cargo build --release
   ```

2. Analyze a log file:
   ```bash
   ./target/release/log_analyzer input.log --format "common" --output "summary.json"
   ```

## Architecture

- **Input:** Read log files asynchronously.
- **Parser:** Use regex patterns to extract fields.
- **Processor:** Aggregate statistics (count, error rate, etc.).
- **Output:** JSON or CSV summary.

## License

MIT
