# Hume Data Processing Utilities

This project provides a comprehensive set of data processing utilities written in the Hume programming language. It includes functionalities for parsing, transforming, validating, and exporting data in various formats.

## Features

- **Data Parsing**: Support for JSON, CSV, and custom delimiters.
- **Data Transformation**: Filter, map, and reduce operations on datasets.
- **Data Validation**: Schema-based validation and type checking.
- **Data Export**: Export processed data to CSV, JSON, and Log formats.

## Prerequisites

- Hume Compiler (`humec`) installed and available in your `PATH`.

## Building

To compile the project, navigate to the root directory and run:

```bash
humec src/main.hum -o data_processor
```

## Usage

### Command Line Arguments

```bash
./data_processor <input_file> <output_file> <format> [--filter <field=value>] [--sort <field>] [--export-csv|--export-json]
```

### Examples

1. **Basic Processing**: Parse JSON input, validate, and export to CSV.
   ```bash
   ./data_processor input.json output.csv json --export-csv
   ```

2. **Filtering and Sorting**: Filter records where `status=active`, sort by `date`.
   ```bash
   ./data_processor input.json output.json json --filter status=active --sort date
   ```

3. **Log Export**: Process data and append to a log file.
   ```bash
   ./data_processor input.csv output.log csv --export-log
   ```

## Project Structure

- `src/main.hum`: Entry point and CLI handling.
- `src/parser.hum`: Data parsing logic (JSON, CSV).
- `src/transformer.hum`: Data transformation (filter, sort, map).
- `src/validator.hum`: Data validation logic.
- `src/exporter.hum`: Data export logic (CSV, JSON, Log).
- `src/types.hum`: Common type definitions.

## License

MIT
