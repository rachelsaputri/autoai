# API Data Sync Tool

A robust data transfer and API interaction script built in Rust to facilitate secure and efficient synchronization between the `anomaly_detector` and `response_orchestrator` services.

## Features

- **High-Performance**: Utilizes `tokio` for asynchronous, concurrent network operations.
- **Type-Safe**: Leverages Rust's type system and `serde` for reliable data serialization/deserialization.
- **Robust Error Handling**: Uses `thiserror` and `Box<dyn Error>` for clear error propagation.
- **Configurable**: Reads configuration from `config.json` (URLs, intervals, timeouts).
- **Logging**: Integrated `env_logger` for observability.

## Architecture

- **Config**: Loads API endpoints and polling intervals.
- **Models**: Defines `AnomalyData` and `SyncResponse` structures.
- **SyncEngine**: The core logic that polls the source and pushes to the destination.

## Setup

1. Ensure Rust is installed.
2. Create a `config.json` file:
   ```json
   {
     "anomaly_url": "http://localhost:8081/api/anomalies",
     "orchestrator_url": "http://localhost:8082/api/events",
     "poll_interval_secs": 5,
     "timeout_secs": 10
   }
   ```
3. Build and run:
   ```bash
   cargo run
   ```
