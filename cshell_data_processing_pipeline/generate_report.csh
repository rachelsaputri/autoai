#!/bin/csh

# Report Generation Script

set INPUT_FILE = "$1"
set OUTPUT_FILE = "$2"

if ( ! $?INPUT_FILE ) then
    echo "Error: Input file not specified."
    exit 1
endif

if ( ! $?OUTPUT_FILE ) then
    set OUTPUT_FILE = "processed_output.csv"
endif

echo "Generating report for $INPUT_FILE -> $OUTPUT_FILE..."

# Copy transformed data to output file
if ( -f temp_transformed.csv ) then
    cp temp_transformed.csv $OUTPUT_FILE
    rm temp_transformed.csv
else
    echo "Error: Transformed data file not found."
    exit 1
endif

echo "Report generated successfully."
exit 0
