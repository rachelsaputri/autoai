# Ace DASL Data Processing Pipeline

## Overview
A complete, production-ready data processing pipeline implemented in Ace DASL. This utility provides a robust framework for ingesting, validating, transforming, and exporting structured data with comprehensive error handling and logging.

## Features
- **Ingestion**: Reads CSV, JSON, and plain text files with automatic delimiter detection.
- **Validation**: Enforces schema definitions with detailed error reporting for missing fields and type mismatches.
- **Transformation**: Supports column renaming, filtering, type casting, and custom expression-based transformations.
- **Export**: Outputs processed data to CSV, JSON, and Excel formats.
- **Logging**: Comprehensive audit trail with timestamped logs of all processing steps.
- **Error Handling**: Graceful recovery from malformed data without pipeline failure.

## Installation
No installation required. The Ace DASL compiler/runtime will handle dependencies.

## Usage
1. Define your schema in `schema.dsl`.
2. Prepare your input data files.
3. Run the main pipeline script:
   ```bash
   ace dasl run main.dasl
   ```
4. Check `logs/pipeline.log` for detailed execution logs.
5. Output files will be generated in the `output/` directory.

## Project Structure
- `main.dasl`: Entry point for the data processing pipeline.
- `schema.dsl`: Schema definitions for data validation.
- `ingestion.dasl`: Data ingestion logic.
- `validation.dasl`: Data validation logic.
- `transformation.dasl`: Data transformation logic.
- `exporter.dasl`: Data export logic.
- `logger.dasl`: Logging and audit trail management.
- `utils.dasl`: Utility functions for common operations.

## License
MIT License
