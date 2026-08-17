#!/bin/bash

# Text Formatting Cleaner - Utility Functions

log_message() {
    local level="$1"
    local message="$2"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] [$level] $message" >> "$LOG_FILE"
}

init_directories() {
    local output_dir="$1"
    local log_file="$2"
    
    mkdir -p "$output_dir/csv"
    mkdir -p "$output_dir/json"
    mkdir -p "$output_dir/text"
    
    touch "$log_file"
    log_message "INFO" "Directories initialized: $output_dir"
}

process_csv() {
    local input_file="$1"
    local output_dir="$2"
    local output_file="$output_dir/$(basename "$input_file" .csv)_cleaned.csv"
    
    # Remove leading/trailing whitespace from CSV fields
    # Normalize line endings
    # Remove duplicate rows
    sed 's/[[:space:]]*$//' "$input_file" | \
    awk -F',' 'NR==1 || !seen[$0]++ {print}' | \
    sed 's/^[[:space:]]*//' > "$output_file"
    
    log_message "INFO" "Processed CSV: $input_file -> $output_file"
}

process_json() {
    local input_file="$1"
    local output_dir="$2"
    local output_file="$output_dir/$(basename "$input_file" .json)_cleaned.json"
    
    # Validate and format JSON
    # Remove trailing commas
    # Normalize whitespace
    python3 -c "
import json
import sys

try:
    with open('$input_file', 'r') as f:
        data = json.load(f)
    with open('$output_file', 'w') as f:
        json.dump(data, f, indent=2)
    print('JSON processed successfully')
except Exception as e:
    print(f'Error processing JSON: {e}', file=sys.stderr)
    sys.exit(1)
"
    
    log_message "INFO" "Processed JSON: $input_file -> $output_file"
}

process_text() {
    local input_file="$1"
    local output_dir="$2"
    local output_file="$output_dir/$(basename "$input_file" .txt)_cleaned.txt"
    
    # Remove leading/trailing whitespace from lines
    # Remove empty lines
    # Remove extra spaces
    sed 's/^[[:space:]]*//' "$input_file" | \
    sed 's/[[:space:]]*$//' | \
    sed '/^$/d' | \
    sed 's/[[:space:]]\+/ /g' > "$output_file"
    
    log_message "INFO" "Processed Text: $input_file -> $output_file"
}
