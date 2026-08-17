# NewLISP Data Processing Utility

A lightweight, functional data processing pipeline written strictly in NewLISP. This utility focuses on parsing, transforming, and validating datasets using NewLISP's native symbolic expressions and list processing capabilities.

## Features
- **Data Ingestion**: Reads CSV and JSON formatted datasets from disk or standard input.
- **Schema Validation**: Ensures incoming data matches expected structural rules.
- **Transformation Engine**: Applies functional transformations (mapping, filtering, reducing) to data records.
- **Export**: Writes processed data to JSON or formatted text logs.
- **Functional Design**: Leverages NewLISP's immutable data structures and higher-order functions.

## Usage
Execute the main entry point from the terminal:
```bash
newlisp main.nlsp -c "(start-pipeline)"
```

## Architecture
- `main.nls`: Entry point and pipeline orchestrator.
- `parser.nls`: Handles raw data ingestion and tokenization.
- `validator.nls`: Schema enforcement and type checking.
- `transformer.nls`: Applies business logic and data transformations.
- `exporter.nls`: Formats and writes output to disk.
- `utils.nls`: Helper functions for string manipulation, math, and error handling.

## Dependencies
- NewLISP v10.7+
- Standard NewLISP libraries (`json.nls`, `string.nls`)

## License
MIT
