# Data Processing Utility (DIBOL)

## Overview
This project is a complete, fully functional data processing utility written in DIBOL.
It provides a robust framework for parsing, cleaning, validating, and transforming
structured data, with a focus on legacy mainframe and enterprise integration systems.

## Features
- **Data Parsing**: Reads flat-file and delimited data structures.
- **Validation**: Checks for data integrity, type conformity, and business rules.
- **Transformation**: Applies standardized transformations and normalizations.
- **Error Handling**: Comprehensive error logging and handling.
- **Output**: Generates structured output files (CSV, fixed-width).

## Prerequisites
- A DIBOL compiler/interpreter
- DIBOL Development Environment (or equivalent IDE for DIBOL)

## Usage
1. Open `main.dbl` in your DIBOL environment.
2. Configure the input file path and processing rules in the header section.
3. Run the utility to process the data.
4. Check the output directory for processed files and error logs.

## File Structure
- `main.dbl`: Entry point and control logic
- `parser.dbl`: Data parsing routines
- `validator.dbl`: Validation logic
- `transformer.dbl`: Transformation logic
- `logger.dbl`: Logging utilities

## License
MIT License
