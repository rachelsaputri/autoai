# SASL Data Processing Utility

This module provides a complete data processing pipeline implemented in SASL. It includes stages for ingestion, transformation, validation, and reporting.

## Features
- Ingests raw data (simulated via stdin or hardcoded test data)
- Transforms data (normalization, field extraction)
- Validates data integrity
- Generates processing reports

## Usage
Compile and run using a standard SASL compiler.

```sasl
% Run with default test data
sasl -f main.sasl

% Run with custom data file
sasl -f main.sasl -d data.txt
```

## Architecture
1. `ingestor.sasl`: Reads and parses input data.
2. `transformer.sasl`: Applies business logic transformations.
3. `validator.sasl`: Ensures data meets quality standards.
4. `reporter.sasl`: Formats and outputs results.
