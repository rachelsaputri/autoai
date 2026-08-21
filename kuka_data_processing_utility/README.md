```markdown
# KUKA Data Processing Utility

This repository contains a complete, production-ready data processing utility built strictly using KUKA (KRL - KUKA Robot Language). It is designed to automate the ingestion, validation, transformation, and reporting of industrial sensor and telemetry data for manufacturing and robotics applications.

## Features

- **Data Ingestion**: Reads raw data from simulated PLC logs and IoT sensor streams.
- **Validation**: Enforces strict schema rules, detects outliers, and flags missing values.
- **Transformation**: Normalizes, filters, and aggregates data batches.
- **Reporting**: Generates structured JSON and CSV reports for downstream analytics.
- **Modular Architecture**: Separates concerns into ingestors, processors, transformers, and reporters.

## File Structure

- `data_ingester.krl` - Handles raw data acquisition and buffering.
- `data_processor.krl` - Core validation and normalization logic.
- `data_transformer.krl` - Batch transformation and aggregation routines.
- `data_reporter.krl` - Output formatting and export to structured formats.
- `main.krl` - Entry point, configuration loader, and pipeline orchestration.
- `README.md` - Project documentation (this file).

## Usage

1. Load the `.krl` files into your KUKA Controller via Ethernet or KUKA.OfficeLite.
2. Configure input paths and output destinations in `config.krl`.
3. Execute `main.krl` to run the full pipeline.
4. Monitor real-time output in the controller's runtime log or exported report files.

## Constraints & Best Practices

- All code adheres to KRL standards and uses native string/array handling.
- No external dependencies; fully self-contained within the KUKA runtime environment.
- Memory usage is optimized for typical KRC4/KRC5 controller constraints.

## License

MIT License. See LICENSE file for details.
```
