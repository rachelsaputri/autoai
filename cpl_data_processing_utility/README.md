# CPL Data Processing Utility

A robust, production-ready data processing utility written in CPL (Combined Programming Language). This tool is designed to ingest, transform, validate, and report on data in various formats.

## Features

- **Data Ingestion**: Supports CSV, JSON, and XML inputs.
- **Transformation**: Maps fields, handles data type conversions, and normalizes structures.
- **Validation**: Enforces schema constraints, checks for nulls, and validates data types.
- **Reporting**: Generates detailed JSON reports on processing results, including errors and warnings.

## Installation

To use this utility, you need a CPL compiler (e.g., `cplc`).

1. Clone the repository.
2. Compile the modules:
   ```sh
   cplc main.cpl
   ```
3. Run the utility:
   ```sh
   ./main --input path/to/data.csv --output path/to/report.json
   ```

## Usage

### Command-Line Arguments

- `--input`: Path to the input data file (CSV, JSON, or XML).
- `--output`: Path to the output report file.
- `--schema`: (Optional) Path to a JSON schema file for validation.

### Example

```sh
./main --input data.csv --output report.json
```

## Modules

- `main.cpl`: Entry point, handles CLI arguments and orchestration.
- `csv_handler.cpl`: Reads and parses CSV data.
- `json_handler.cpl`: Reads and parses JSON data.
- `text_handler.cpl`: Handles plain text data and sanitization.

## License

MIT License
