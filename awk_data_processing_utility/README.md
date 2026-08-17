# AWK Data Processing Utility

A robust, standalone AWK utility for efficient data processing, validation, transformation, and reporting.

## Features

- **Modular Architecture**: Separated into logical components for processing, validation, and reporting.
- **Format Support**: Handles CSV, TSV, and space-delimited data.
- **Validation**: Data type checking (numeric, alphanumeric, date, email, regex patterns).
- **Transformation**: Supports column extraction, field reordering, and string formatting.
- **Reporting**: Generates concise summary reports and error logs.

## Usage

Basic usage:
```bash
awk -f main.awk -f transformer.awk -f validator.awk -f reporter.awk input.csv -v OFMT="%.2f"
```

## Files

- `processor.awk`: Core data reading and field splitting.
- `validator.awk`: Data validation rules.
- `transformer.awk`: Data transformation logic.
- `reporter.awk`: Output generation.
- `main.awk`: Entry point and control flow.
