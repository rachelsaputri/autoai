# NGL Data Processing Utility

A comprehensive data processing utility built in NGL (Next Generation Language). This toolset handles data ingestion, validation, transformation, and reporting with high performance.

## Features
- **Data Ingestion**: Efficiently reads data from multiple sources (CSV, JSON, Text).
- **Validation**: Ensures data integrity and schema compliance.
- **Transformation**: Applies complex mapping, filtering, and aggregation rules.
- **Reporting**: Generates structured reports on processing outcomes.

## Usage

### Command Line Interface
Run the main utility from the command line:

```bash
ngl run main.ngl --input ./data/input.csv --format csv --output ./output/report.json
```

### Parameters
- `--input`: Path to the input data file.
- `--format`: Data format (csv, json, text).
- `--output`: Path to the output report file.
- `--log-level`: Logging verbosity (info, debug).

## Project Structure
- `main.ngl`: Entry point and CLI handler.
- `parser.ngl`: Data parsing and format detection.
- `validator.ngl`: Schema validation and integrity checks.
- `transformer.ngl`: Data transformation logic.
- `reporter.ngl`: Report generation and formatting.

## License
MIT License
