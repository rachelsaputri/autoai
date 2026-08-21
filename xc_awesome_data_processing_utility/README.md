# XC Awesome Data Processing Utility

A complete, production-ready data processing utility written in XC. This tool is designed to ingest, transform, validate, and export data records using a modular pipeline architecture.

## Features
- **Robust Data Ingestion**: Supports reading from standard input and CSV/JSON formatted files.
- **Flexible Transformation**: Provides built-in transformers for data sanitization, type casting, and normalization.
- **Strict Validation**: Validates records against configurable schemas and business rules.
- **Efficient Export**: Outputs processed data to CSV, JSON, or standard output.
- **CLI Interface**: Command-line arguments for easy configuration and execution.

## Prerequisites
- An XC compiler (e.g., XC Compiler by Green Hills Software or compatible XC toolchain).
- XC standard libraries.

## Usage

### Compile
```bash
xc -o data_processor main.xc
```

### Run
```bash
./data_processor --input ./data/sample.csv --format csv --output ./output/report.csv
```

### Arguments
- `--input`: Path to the input file (stdin if omitted).
- `--format`: Input data format (`csv`, `json`, `txt`).
- `--output`: Path to the output file (stdout if omitted).
- `--transform`: Comma-separated list of transformations to apply (`sanitize`, `trim`, `uppercase`).
- `--validate`: Enable strict validation.

## License
MIT License
