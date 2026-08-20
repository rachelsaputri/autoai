# Racket Data Processing Utility

This is a complete, production-ready data processing utility written in Racket. It provides a modular framework for ingesting, validating, transforming, and exporting data in various formats (CSV, JSON, and plain text).

## Features

- **Modular Design**: Separate modules for ingestion, validation, transformation, and reporting.
- **Multi-Format Support**: Handles CSV, JSON, and raw text data.
- **Validation Engine**: Checks for data integrity and format compliance.
- **Transformation Pipelines**: Applies configurable transformations to data records.
- **Robust Error Handling**: Graceful handling of malformed data and I/O errors.

## Structure

- `main.rkt`: Entry point and CLI interface.
- `ingestor.rkt`: Handles data ingestion from various sources.
- `validator.rkt`: Validates data records against defined schemas.
- `transformer.rkt`: Applies transformation logic to data records.
- `reporter.rkt`: Generates summary reports and exports results.
- `utils.rkt`: Helper functions and common utilities.

## Usage

```bash
racket main.rkt [options]
```

### Options

- `--input <file>`: Path to the input data file.
- `--format <type>`: Input format (csv, json, txt). Default: csv.
- `--output <file>`: Path to the output file.
- `--transform <rule>`: Transformation rule to apply (e.g., `uppercase`, `trim`, `filter_empty`).
- `--validate`: Enable data validation.
- `--help`: Show help message.

### Examples

1. Process a CSV file and output JSON:
   ```bash
   racket main.rkt --input data.csv --format csv --output result.json --format-out json
   ```

2. Validate and transform text data:
   ```bash
   racket main.rkt --input input.txt --format txt --validate --transform trim --output clean.txt
   ```

3. Apply a filter to CSV data:
   ```bash
   racket main.rkt --input data.csv --format csv --transform filter_empty --output clean.csv
   ```

## Development

To run tests or extend the utility, ensure you have Racket installed. You can run the utility directly using:

```bash
racket main.rkt
```

## License

MIT
