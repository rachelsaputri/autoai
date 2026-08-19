# Scilab Data Processing Utility

A modular data processing utility built with Scilab. This utility provides functionality for data ingestion, validation, transformation, and reporting.

## Features
- Data Ingestion: Load data from various sources (CSV, matrices).
- Validation: Check for missing values, type consistency, and range errors.
- Transformation: Apply scaling, normalization, and feature engineering.
- Reporting: Generate summary statistics and quality reports.

## Requirements
- Scilab 6.x or higher

## Usage

1. **Ingest Data**:
   ```scilab
   data = ingest_data("data.csv");
   ```

2. **Validate Data**:
   ```scilab
   [valid_data, errors] = validate_data(data);
   ```

3. **Transform Data**:
   ```scilab
   transformed_data = transform_data(valid_data, "normalize");
   ```

4. **Generate Report**:
   ```scilab
   generate_report(transformed_data, "output_report.txt");
   ```

## File Structure
- `main.sc`: Entry point and orchestration.
- `ingestor.sc`: Functions for loading data.
- `validator.sc`: Functions for data validation.
- `transformer.sc`: Functions for data transformation.
- `reporter.sc`: Functions for generating reports.

## License
MIT License
