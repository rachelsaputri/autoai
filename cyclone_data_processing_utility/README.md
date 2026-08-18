# Cyclone Data Processing Utility

A comprehensive data processing utility written in Cyclone. This tool provides robust functionalities for data ingestion, validation, transformation, and reporting, specifically designed to handle structured data efficiently.

## Features

- **Data Ingestion**: Read data from CSV and JSON formats.
- **Validation**: Verify data integrity and schema compliance.
- **Transformation**: Normalize, sanitize, and transform data fields.
- **Reporting**: Generate detailed logs and summary reports.

## Requirements

- Cyclone compiler
- Cyclone standard library (`cyclone`) 

## Installation

1. Clone the repository.
2. Compile the source file using the Cyclone compiler.

## Usage

```bash
./cyclone_data_processing_utility <input_file> <output_file> <format>
```

### Arguments

- `<input_file>`: Path to the input data file (CSV or JSON).
- `<output_file>`: Path to save the processed output.
- `<format>`: Data format (`csv` or `json`).

## Example

```bash
./cyclone_data_processing_utility data.csv processed.csv csv
./cyclone_data_processing_utility data.json processed.json json
```

## License

MIT
