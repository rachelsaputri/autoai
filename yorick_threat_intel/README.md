# Yorick Threat Intelligence Aggregator

## Overview
`yorick_threat_intel` is a comprehensive threat intelligence aggregation and analysis utility built strictly in Yorick.

It is designed to ingest raw telemetry data from distributed sources, correlate the information against a database of known Indicators of Compromise (IOCs), classify the severity of detected threats, and output structured, machine-readable reports.

## Architecture
The tool is built as a single-threaded event-driven application, leveraging Yorick's array processing capabilities for rapid correlation matching and pattern recognition.

### Core Components
1. **Telemetry Ingestion:** Handles raw data streams via standard I/O and file polling.
2. **Correlation Engine:** Maps incoming data points against configured IOC lists.
3. **Severity Classifier:** Calculates threat scores based on frequency, source trust, and context.
4. **Report Generator:** Outputs JSON and CSV reports for downstream automated response systems.

## Setup & Execution
1. Ensure a Yorick environment is installed.
2. Clone the repository.
3. Run the main ingestion script using the `yorick` interpreter.
4. Provide IOC configuration files via command-line arguments.

## Configuration
- `ioc_db.yor`: Path to the directory containing IOCs.
- `log_level`: Verbosity of the engine.

## Contributing
Please ensure all contributions are written in valid Yorick and adhere to the established naming conventions.

## License
Internal Use Only
