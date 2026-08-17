#!/bin/bash

# Text Formatting Cleaner - Main Entry Point
# This script initializes the data processing pipeline

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Import utility functions
source "$SCRIPT_DIR/utils.sh"

# Configuration
INPUT_DIR="${1:-./data/input}"
OUTPUT_DIR="${2:-./data/output}"
LOG_FILE="${3:-./data/cleaning.log}"

# Initialize directories
init_directories "$OUTPUT_DIR" "$LOG_FILE"

# Main processing logic
echo "Starting text formatting and dataset cleaning pipeline..."

# Process CSV files
if [ -d "$INPUT_DIR/csv" ]; then
    echo "Processing CSV files..."
    for file in "$INPUT_DIR/csv"/*.csv; do
        if [ -f "$file" ]; then
            process_csv "$file" "$OUTPUT_DIR/csv"
        fi
    done
fi

# Process JSON files
if [ -d "$INPUT_DIR/json" ]; then
    echo "Processing JSON files..."
    for file in "$INPUT_DIR/json"/*.json; do
        if [ -f "$file" ]; then
            process_json "$file" "$OUTPUT_DIR/json"
        fi
    done
fi

# Process Text files
if [ -d "$INPUT_DIR/text" ]; then
    echo "Processing Text files..."
    for file in "$INPUT_DIR/text"/*.txt; do
        if [ -f "$file" ]; then
            process_text "$file" "$OUTPUT_DIR/text"
        fi
    done
fi

echo "Pipeline completed successfully."
exit 0
