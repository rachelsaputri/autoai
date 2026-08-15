# OpenEdge ABL Data Processing Utility

This utility provides a robust framework for data processing tasks using OpenEdge Progress ABL (Advanced Business Language).

## Features

- **Data Ingestion**: Read from CSV, JSON, and database tables.
- **Data Transformation**: Clean, format, and validate records.
- **Data Export**: Write processed data to CSV, JSON, or log files.
- **Error Handling**: Robust logging and error recovery.

## Structure

- `main.acl`: Main application entry point.
- `data_ingestion.acl`: Handles reading data from various sources.
- `data_transformation.acl`: Contains business logic for data cleaning and validation.
- `data_export.acl`: Handles writing processed data to output files.
- `logger.acl`: Centralized logging utility.
- `config.acl`: Configuration management (paths, thresholds, etc.).

## Usage

1. Ensure OpenEdge ABL is installed and configured.
2. Update `config.acl` with your data source paths and database connections.
3. Run `main.acl` to start the data processing pipeline.

## Example

```progress
/* Example: Load configuration */
RUN loadConfig IN config.

/* Example: Process a single record */
RUN transformRecord IN data_transformation(pInputRecord, pOutputRecord).p
```

## License

MIT
