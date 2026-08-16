#!/bin/csh

# Main Data Processing Pipeline Script

set INPUT_FILE = "$1"
set OUTPUT_FILE = "$2"
set VALIDATION_THRESHOLD = 0.95

if ( ! $?INPUT_FILE ) then
    echo "Error: Input file not specified."
    echo "Usage: main.csh <input_file> [output_file]"
    exit 1
endif

if ( ! $?OUTPUT_FILE ) then
    set OUTPUT_FILE = "processed_output.csv"
endif

echo "Starting data processing pipeline..."
echo "Input file: $INPUT_FILE"
echo "Output file: $OUTPUT_FILE"

if ( ! -f $INPUT_FILE ) then
    echo "Error: Input file does not exist."
    exit 1
endif

echo "Phase 1: Data Validation"
set STATUS = `csh validate_data.csh $INPUT_FILE $VALIDATION_THRESHOLD`
if ( $STATUS != 0 ) then
    echo "Data validation failed. Exiting."
    exit 1
endif

echo "Phase 2: Data Transformation"
csh transform_data.csh $INPUT_FILE

set STATUS = $?
if ( $STATUS != 0 ) then
    echo "Data transformation failed. Exiting."
    exit 1
endif

echo "Phase 3: Generating Report"
csh generate_report.csh $INPUT_FILE $OUTPUT_FILE

echo "Data processing pipeline completed successfully."
exit 0
