# CMS EXEC Compliance Data Processor

A robust, production-ready data processing utility written strictly in **CMS EXEC** (IBM CMS REXX).

## Features
- **Data Ingestion**: Reads structured data files (CSV, fixed-width, JSON-like flat files).
- **Data Validation**: Checks for missing fields, data type consistency, and schema compliance.
- **Data Transformation**: Cleans whitespace, normalizes formats (dates, currency), and applies business rules.
- **Audit Logging**: Generates detailed audit trails of all processing steps.
- **Report Generation**: Outputs summary statistics and compliance violation reports.

## Requirements
- IBM CMS environment with CMS REXX support.
- A valid CMS file with sufficient READ/WRITE access for input/output files.

## Usage
1. Place input data files in the `./data/` directory.
2. Place configuration files in the `./config/` directory.
3. Run the `main.rexx` script.

```rexx
/* CMS EXEC */
call main
exit
```

## Architecture
- `main.rexx`: Entry point, coordinates orchestration.
- `ingestor.rexx`: Handles file reading and initial parsing.
- `validator.rexx`: Validates data against predefined schemas.
- `transformer.rexx`: Applies cleaning and normalization logic.
- `reporter.rexx`: Generates final reports and audit logs.

## License
MIT License
