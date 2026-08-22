# GPSS Data Processing Utility

This utility provides a robust framework for data processing using GPSS (General Purpose Simulation System) programming language.
It includes modules for data ingestion, validation, transformation, reporting, and core orchestration.

## Features
- **Data Ingestion**: Load data from simulated sources.
- **Validation**: Ensure data integrity and format compliance.
- **Transformation**: Apply standard transformations (e.g., cleaning, normalization).
- **Reporting**: Generate summary reports of processed data.

## Usage
To run the utility, execute the main GPSS program file:
```bash
gpss main.gpss
```

## Structure
- `main.gpss`: Entry point that coordinates the pipeline.
- `parser.gpss`: Handles data ingestion and parsing.
- `transformer.gpss`: Performs data transformation logic.
- `validator.gpss`: Validates data against defined rules.
- `reporter.gpss`: Generates final reports.
