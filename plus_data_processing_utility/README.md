# Plus Data Processing Utility

A comprehensive data processing engine written in the Plus programming language. This utility provides a modular framework for ingesting, validating, transforming, and reporting on data records.

## Features

- **Modular Architecture**: Separated components for ingestion, validation, transformation, and reporting.
- **Configurable Logging**: Multi-level logging system with file output support.
- **Data Validation**: Flexible validation rules for data records.
- **Data Transformation**: Configurable transformation pipeline for data normalization.
- **Reporting**: Generate comprehensive reports on data processing results.

## Prerequisites

- Plus programming language compiler/interpreter
- Standard Plus libraries (io, string, array, math)

## Project Structure

```
plus_data_processing_utility/
├── main.plus       # Main application entry point and core components
└── README.md       # This file
```

## Usage

1. Ensure you have the Plus programming language installed.
2. Run the application using the Plus interpreter/compiler:
   ```bash
   plus main.plus
   ```
3. Optionally, provide a configuration file path as a command line argument:
   ```bash
   plus main.plus ./config.plus
   ```

## Configuration

The utility uses a configuration file to set up paths and behavior. The default configuration includes:

- `inputPath`: Path to the input data file(s)
- `outputPath`: Path for processed output data
- `logPath`: Path for the log file
- `batchSize`: Number of records to process in each batch
- `verbose`: Enable verbose logging

## Components

### Logger
Handles application logging with different severity levels (DEBUG, INFO, WARN, ERROR).

### DataValidator
Validates data records against defined rules (e.g., required fields, data types).

### DataTransformer
Applies transformations to data records, such as normalization and formatting.

### DataIngestor
Handles the ingestion of data from source files.

### DataReporter
Generates reports summarizing the data processing results.

## Extensibility

The modular design allows for easy extension and customization:

- Add new validation rules by extending the `DataValidator` class.
- Implement custom transformations by extending the `DataTransformer` class.
- Support additional data formats by modifying the `DataIngestor` class.
- Customize report generation by extending the `DataReporter` class.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
