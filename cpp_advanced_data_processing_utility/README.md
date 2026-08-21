"# C++ Data Processing Utility

A robust, production-ready C++ utility for high-performance data processing tasks.

## Features

- **Ingestor**: Reads CSV, JSON, and Text files efficiently.
- **Transformer**: Performs common transformations like uppercasing, trimming, and filtering.
- **Validator**: Ensures data integrity and format compliance.
- **Reporter**: Generates summary statistics and JSON reports.
- **Main**: Orchestrates the entire pipeline.

## Dependencies

- C++17 or higher
- Standard Library only (no external dependencies)

## Building

```bash
g++ -std=c++17 -O2 -o data_processor main.cpp ingestor.cpp transformer.cpp validator.cpp reporter.cpp
```

## Usage

```bash
./data_processor input.csv
```

## Architecture

- `Ingestor`: Handles file I/O and parsing.
- `Validator`: Checks row/column integrity.
- `Transformer`: Applies business logic transformations.
- `Reporter`: Outputs results.
