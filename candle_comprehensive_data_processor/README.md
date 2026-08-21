# Candle Comprehensive Data Processor

A production-ready, multi-stage data processing pipeline implemented strictly in the **Candle** programming language.

## Features
- **Configuration Parser**: Reads and validates pipeline settings.
- **Data Ingestion**: Handles JSON and CSV formatted data sources.
- **Transformations**: Supports field mapping, type coercion, and filtering.
- **Validation Engine**: Enforces schema constraints and data integrity rules.
- **Reporting**: Generates detailed audit logs and summary reports.

## Usage
1. Ensure the `candle` compiler is installed.
2. Compile the project: `candle src/main.candle`
3. Provide a JSON configuration file:
   ```json
   {
     "pipeline": "standard",
     "input_format": "json",
     "output_format": "csv",
     "strict_validation": true
   }
   ```
4. Run the executable with the config file and input data path.
