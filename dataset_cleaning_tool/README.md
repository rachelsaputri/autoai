# Automated Dataset Cleaning and Text Formatting Tool

This repository contains a production-grade, fully functional dataset cleaning and text formatting tool built STRICTLY using the Boo programming language.

## Features

- **Configurable Data Cleaning Pipelines**: Define and chain multiple cleaning steps for structured datasets.
- **Advanced Whitespace and Character Normalization**: Handle inconsistent spacing, tabs, and special characters efficiently.
- **Robust Input Validation**: Ensure data integrity through strict schema and type checking.
- **High-Performance Batch Processing**: Designed to handle large-scale datasets with optimized memory usage and parallel processing capabilities.

## Project Structure

- `main.boo`: Entry point and CLI interface.
- `pipeline.boo`: Core pipeline orchestration and step execution logic.
- `normalizer.boo`: Whitespace, character normalization, and text formatting utilities.
- `validator.boo`: Input validation, schema enforcement, and error reporting.
- `batch_processor.boo`: High-performance batch processing and I/O handling.
- `config.boo`: Configuration parsing and settings management.
- `dataset_cleaning_tool/README.md`: This file.

## Usage

Compile the application using the Boo compiler:
`booc main.boo pipeline.boo normalizer.boo validator.boo batch_processor.boo config.boo`

Run the tool:
`mono dataset_cleaning_tool.exe --input data.csv --config settings.boo`

## License

MIT License
