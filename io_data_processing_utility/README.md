# Io Data Processing Utility

A comprehensive, fully functional data processing utility written in the Io programming language.
This tool provides a robust pipeline for ingesting, transforming, validating, and reporting on datasets.

## Features

- **Data Ingestion**: Support for JSON and CSV data sources.
- **Transformation**: Flexible field mapping, filtering, and enrichment.
- **Validation**: Schema-based validation to ensure data integrity.
- **Reporting**: Generate summary statistics and export processed data.
- **Pipeline Architecture**: Modular design allowing easy extension of processing stages.

## Requirements

- Io Language (version 0.8 or later)

## Usage

1. **Configuration**: Define your processing pipeline in `config.json`.
2. **Run**: Execute the main processor script.

```bash
io main.io
```

3. **Output**: Processed data and reports will be generated in the `output/` directory.

## Configuration

Create a `config.json` file in the same directory as `main.io`.

Example:
```json
{
    "input": {
        "type": "json",
        "path": "data/input.json"
    },
    "transformations": [
        {
            "type": "map",
            "fields": {
                "old_name": "new_name"
            }
        }
    ],
    "validation": {
        "schema": {
            "new_name": "string",
            "age": "number"
        }
    },
    "output": {
        "type": "csv",
        "path": "output/result.csv"
    }
}
```

## Project Structure

- `main.io`: Entry point of the application.
- `data_ingester.io`: Handles loading data from various formats.
- `data_transformer.io`: Applies transformations to the data.
- `data_validator.io`: Validates data against defined schemas.
- `data_reporter.io`: Generates reports and exports data.
- `config.json`: Pipeline configuration.
- `data/`: Directory for input data.
- `output/`: Directory for output files.

## Contributing

Feel free to submit issues and enhancement requests.
