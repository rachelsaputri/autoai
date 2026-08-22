#!/bin/bash

###############################################################################
# Bash Data Processing Utility - Transformer Module
###############################################################################

# run_transformer: Main entry point for transformation logic
# Args: $1 = input file, $2 = output file, $3 = separator
run_transformer() {
    local input_file="$1"
    local output_file="$2"
    local separator="$3"
    
    local temp_file
    temp_file=$(mktemp)
    
    # Process each line
    while IFS= read -r line; do
        # Skip empty lines and comments
        [[ -z "$line" ]] && continue
        [[ "$line" =~ ^# ]] && continue
        
        # Transform: Trim leading/trailing whitespace
        local cleaned_line
        cleaned_line=$(echo "$line" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
        
        # Transform: Convert to lowercase for consistency
        local lower_case_line
        lower_case_line=$(echo "$cleaned_line" | tr '[:upper:]' '[:lower:]')
        
        # Transform: Remove special characters except alphanumeric, comma, space, period, dash
        local sanitized_line
        sanitized_line=$(echo "$lower_case_line" | sed 's/[^a-z0-9, \.-]//g')
        
        echo "$sanitized_line"
    done < "$input_file" > "$temp_file"
    
    mv "$temp_file" "$output_file"
    return 0
}
