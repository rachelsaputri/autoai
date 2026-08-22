# G-code Data Processing Utility

A fully functional data processing utility written in G-code. This tool processes raw data files, transforms the data, validates entries, and generates reports. It is designed to be run on CNC machines or G-code interpreters that support file I/O and basic logic.

## Features
- **Data Ingestion**: Reads raw data from input files.
- **Data Transformation**: Applies transformations (scaling, filtering, normalization).
- **Data Validation**: Checks for data integrity and compliance with rules.
- **Report Generation**: Outputs processed data and summaries to log files.

## Usage
1. Place input data files in the `input/` directory.
2. Configure parameters in `config.gcode`.
3. Run the main script: `main.gcode`.
4. Check the `output/` directory for results and logs.

## File Structure
- `main.gcode`: Entry point for the utility.
- `processor.gcode`: Core data processing logic.
- `transformer.gcode`: Data transformation routines.
- `validator.gcode`: Data validation rules.
- `reporter.gcode`: Report generation logic.
- `config.gcode`: Configuration parameters.
- `README.md`: This file.

## Notes
- Ensure your G-code interpreter supports file I/O operations (e.g., `#<FILE_OPEN>`, `#<READ>`, `#<WRITE>`, `#<FILE_CLOSE>`).
- This utility assumes a specific G-code dialect. Adjust if necessary.
