# OpenEdge Data Processing Pipeline

A modular data processing pipeline built using OpenEdge ABL (Advanced Business Language). This utility is designed to handle data ingestion, transformation, validation, and reporting within OpenEdge database environments.

## Features
- **Data Ingestion**: Reads data from CSV, JSON, or database tables.
- **Transformation**: Applies business rules and data cleansing.
- **Validation**: Checks for data integrity and compliance.
- **Reporting**: Generates summary reports of processed data.

## Structure
- `main.acl`: Entry point and orchestration.
- `processor.acl`: Core transformation logic.
- `validator.acl`: Data validation rules.
- `reporter.acl`: Report generation.

## Usage
1. Configure input sources in `processor.acl`.
2. Run `main.acl` to execute the pipeline.

## Requirements
- OpenEdge 12.2 or later
- ABL Runtime
