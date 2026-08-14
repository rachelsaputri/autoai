# Alert Correlation Persistence Layer

This tool implements a robust event correlation and persistence layer for the `alert_dispatch_engine`. It ingests raw alert streams, computes derived threat scores, and archives validated events to a tamper-evident log.

## Features

- **Event Ingestion:** High-throughput ingestion of raw alert streams from `alert_dispatch_engine`.
- **Correlation Engine:** Computes derived threat scores by correlating events across multiple sources.
- **Tamper-Evident Log:** Archives validated events in a secure, append-only log format.
- **LPC Implementation:** Built strictly using LPC for high performance and low-level control.

## Integration

- **alert_dispatch_engine:** Receives raw alert streams for processing.
- **anomaly_detector:** Shares threat score data for advanced analysis.

## Structure

- `main.lpc`: Main application entry point and configuration.
- `ingestion.lpc`: Event ingestion and validation logic.
- `correlation.lpc`: Event correlation and threat score computation.
- `archiver.lpc`: Tamper-evident log archiving functionality.
- `config.lpc`: Configuration management and runtime tuning.

## Usage

1. Configure `config.lpc` with your alert dispatch engine settings.
2. Run the tool to start ingesting and processing alert streams.
3. Monitor the tamper-evident log for validated and archived events.

## Performance Tuning

Adjust the following parameters in `config.lpc` to optimize performance:

- `ingestion_batch_size`: Number of events to process per batch.
- `correlation_window`: Time window for event correlation.
- `archiver_flush_interval`: Frequency of log flush operations.

## Security

- **Tamper-Evident Log:** Uses cryptographic hashing to ensure log integrity.
- **Access Control:** Restricts access to sensitive configuration and log files.

## License

MIT License
