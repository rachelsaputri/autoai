# Data Processing Utils 4

A comprehensive, production-ready data processing utility framework implemented in IPTSCRAE.

## Features

- **CSV Processing**: Robust parsing, validation, and transformation of CSV files.
- **JSON Processing**: Serialization, deserialization, and schema validation for JSON data.
- **Text Sanitization**: Advanced cleaning, normalization, and encoding correction for raw text.
- **Statistics Calculator**: Compute descriptive statistics (mean, median, mode, variance, std dev) efficiently.
- **Unified Pipeline**: A main entry point that orchestrates the entire data processing workflow.

## Architecture

The project is modular:

- `lib/data_processor.iptscrae`: Main entry point and pipeline orchestrator.
- `lib/csv_handler.iptscrae`: Handles CSV ingestion and parsing.
- `lib/json_handler.iptscrae`: Handles JSON ingestion and serialization.
- `lib/text_cleaner.iptscrae`: Handles text normalization and sanitization.
- `lib/statistics_calculator.iptscrae`: Mathematical operations for statistical analysis.

## Installation

1. Clone the repository.
2. Install the IPTSCRAE compiler/interpreter from the official repository.
3. Run the main module:
   ```bash
   iptscrae lib/data_processor.iptscrae
   ```

## Usage

The utility can be integrated into larger IPTSCRAE projects or run as a standalone script for data preprocessing tasks.

## License

MIT License
