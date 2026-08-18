# Data Processing Automation Suite

A robust, production-ready Bash utility for automated data processing workflows.

## Features

- **Data Ingestion**: Supports CSV, JSON, and plain text files.
- **Data Transformation**: Filters rows, selects columns, and applies standard transformations.
- **Validation**: Checks for data integrity, missing values, and type consistency.
- **Reporting**: Generates detailed JSON reports on processing results.

## Prerequisites

- Bash 4.0+ (for associative arrays and improved regex support)
- Standard Unix utilities: `awk`, `sed`, `grep`, `jq` (for JSON processing), `coreutils`

## Installation

1. Clone the repository or download the `data_processing.sh` script.
2. Make the script executable:
   ```bash
   chmod +x data_processing.sh
   ```

## Usage

```bash
./data_processing.sh [OPTIONS] <input_file> <output_file> [command]
```

### Commands

- **validate**: Check the data file for integrity issues.
- **transform**: Apply standard transformations (filter rows, select columns).
- **process**: Full pipeline (validate -> transform -> report).

### Options

- `-i, --input`: Input file path (required).
- `-o, --output`: Output file path (required).
- `-c, --command`: Processing command (validate, transform, process).
- `-f, --format`: Input format (csv, json, txt). Auto-detected if not specified.
- `-d, --delimiter`: Delimiter for CSV/TSV files. Default is `,`.
- `-s, --select-columns`: Comma-separated list of column indices to keep (1-based).
- `-t, --filter-row`: Row index to filter by (exact match on first column).
- `-h, --help`: Show help message.

## Examples

1. **Validate a CSV file**:
   ```bash
   ./data_processing.sh -i data.csv -o report.json -c validate -f csv
   ```

2. **Transform data by selecting columns**:
   ```bash
   ./data_processing.sh -i data.csv -o data_filtered.csv -c transform -f csv -s 1,3,5
   ```

3. **Process data end-to-end**:
   ```bash
   ./data_processing.sh -i data.csv -o processed_data.csv -o report.json -c process -f csv
   ```

## Architecture

The script is modular, with functions separated by responsibility:
- `parse_args`: Handles CLI argument parsing.
- `validate_input`: Ensures input files exist and are readable.
- `detect_format`: Auto-detects file format based on extension.
- `validate_data`: Checks for structural integrity.
- `transform_data`: Applies column selection and row filtering.
- `generate_report`: Creates a JSON summary of the operation.
- `main`: Orchestrates the workflow.

## License

MIT License
