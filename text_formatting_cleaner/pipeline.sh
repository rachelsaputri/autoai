#!/bin/bash

# Text Formatting Cleaner - Pipeline Controller

set -e

# Source utility functions
source "$(dirname "$0")/utils.sh"

# Configuration
INPUT_DIR="${1:-./data/input}"
OUTPUT_DIR="${2:-./data/output}"
LOG_FILE="${3:-./data/cleaning.log}"

# Validate input directory
if [ ! -d "$INPUT_DIR" ]; then
    echo "Error: Input directory '$INPUT_DIR' not found."
    exit 1
fi

# Initialize the pipeline
echo "Initializing text formatting and dataset cleaning pipeline..."
init_directories "$OUTPUT_DIR" "$LOG_FILE"

# Process CSV files
echo "Processing CSV files..."
if [ -d "$INPUT_DIR/csv" ]; then
    for file in "$INPUT_DIR/csv"/*.csv; do
        [ -f "$file" ] && process_csv "$file" "$OUTPUT_DIR/csv"
    done
else
    echo "Warning: No CSV directory found in input directory."
fi

# Process JSON files
echo "Processing JSON files..."
if [ -d "$INPUT_DIR/json" ]; then
    for file in "$INPUT_DIR/json"/*.json; do
        [ -f "$file" ] && process_json "$file" "$OUTPUT_DIR/json"
    done
else
    echo "Warning: No JSON directory found in input directory."
fi

# Process Text files
echo "Processing Text files..."
if [ -d "$INPUT_DIR/text" ]; then
    for file in "$INPUT_DIR/text"/*.txt; do
        [ -f "$file" ] && process_text "$file" "$OUTPUT_DIR/text"
    done
else
    echo "Warning: No Text directory found in input directory."
fi

echo "Pipeline completed successfully."
echo "Logs available at: $LOG_FILE"
echo "Output available at: $OUTPUT_DIR"

exit 0
