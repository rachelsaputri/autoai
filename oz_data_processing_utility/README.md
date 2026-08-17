# Oz Data Processing Utility

## Overview
A robust, functional data processing utility written in Oz. It provides capabilities for:

- **Data Ingestion**: Loading data from various formats (CSV, JSON, Text)
- **Data Transformation**: Mapping, filtering, aggregating, and normalizing records
- **Validation**: Schema checking and data integrity verification
- **Export**: Writing processed data to output files

## Features
- Pure functional approach with lazy evaluation where appropriate
- Pattern matching for data structure decomposition
- Higher-order functions for transformation pipelines
- Configurable validation rules
- Modular architecture with separate components for ingestion, processing, and export

## Requirements
- Mozart/Oz compiler

## Installation
1. Clone or copy the repository
2. Ensure Mozart/Oz is installed and accessible in PATH
3. Run the main program:
   ```bash
   ozc main.ozf
   oz -n -b:run main.ozf
   ```

## Usage
The main entry point is `main.oz`. You can configure the data processing pipeline by modifying the configuration options in the main file or by passing parameters to the system.

### Example Pipeline
```oz
% Define data
Data = {NewList} 'record1' 'record2' 'record3'

% Apply transformations
Processed = {ProcessData Data}

% Validate
Validated = {ValidateData Processed}

% Export
{ExportData Validated 'output.csv'}
```

## Components
- **main.oz**: Entry point and orchestration
- **DataEngine.oz**: Core data processing logic
- **Parser.oz**: Input format parsing
- **Validator.oz**: Schema and rule validation
- **Exporter.oz**: Output format handling
- **Types.oz**: Type definitions and helpers

## License
MIT License

## Author
Oz Data Processing Utility Team
