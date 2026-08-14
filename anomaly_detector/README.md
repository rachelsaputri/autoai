# Anomaly Detection Engine

## Overview
The Anomaly Detection Engine is a high-performance, real-time component designed to detect subtle behavioral deviations in security events. It sits between the Correlation Engine and the Alert Dispatch Engine, adding a statistical intelligence layer to the security pipeline.

## Architecture
- **Input**: Consumes correlated alerts from the `correlation_engine` via high-speed IPC.
- **Processing**: Utilizes Rust's `ndarray` for SIMD-optimized statistical computations (Z-Scores, Entropy).
- **Output**: Generates `AnalysisResult` objects containing anomaly scores and deviation types.

## Features
- **Statistical Analysis**: Calculates Z-scores against a sliding window baseline.
- **Entropy Analysis**: Measures randomness in event streams to identify automated attacks.
- **Low Latency**: Designed for sub-millisecond processing using Rust's concurrency model.

## Integration
1. Compile: `cargo build --release`
2. Run: `./target/release/anomaly_engine`
3. The engine expects a `config.json` in the root directory.

## Configuration (`config.json` example)
```json
{
  "port": 8080,
  "window_size": 1000,
  "z_score_threshold": 2.5,
  "entropy_threshold": 0.8,
  "data_store_url": "redis://localhost:6379"
}
```
