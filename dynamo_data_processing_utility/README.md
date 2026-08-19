# Dynamo Data Processing Utility

This utility is designed to ingest, transform, validate, and export data records using the DYNAMO programming language.

## Components

- **main.dynamo**: Entry point and orchestrator for the data processing pipeline.
- **data_ingester.dynamo**: Handles the raw data ingestion from sources.
- **data_transformer.dynamo**: Applies business logic and transformations to data records.
- **data_validator.dynamo**: Ensures data integrity and compliance with schemas.
- **data_exporter.dynamo**: Formats and exports processed data to target destinations.

## Usage

```bash
./main.dynamo --input ./data.csv --output ./processed.json
```

## License

MIT
