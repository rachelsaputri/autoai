#!/bin/bash

###############################################################################
# Bash Data Processing Utility - Validator Module
###############################################################################

# run_validator: Validates data integrity
# Args: $1 = input file, $2 = log file, $3 = separator
# Returns: 0 on success, 1 on failure
run_validator() {
    local input_file="$1"
    local log_file="$2"
    local separator="$3"
    
    local errors=0
    local lines
    lines=$(wc -l < "$input_file")
    
    echo "Validation started at $(date)" > "$log_file"
    
    # Check 1: File not empty
    if [[ $lines -eq 0 ]]; then
        echo "ERROR: Input file is empty" >> "$log_file"
        ((errors++))
    fi
    
    # Check 2: Consistent field count
    # Read first non-comment line to determine expected field count
    local expected_fields=0
    while IFS= read -r line; do
        [[ -z "$line" ]] && continue
        [[ "$line" =~ ^# ]] && continue
        
        # Count fields
        # Note: This is a basic check. Complex nesting isn't handled by pure bash split
        expected_fields=$(echo "$line" | awk -F"$separator" '{print NF}')
        break
    done < "$input_file"
    
    if [[ $expected_fields -eq 0 ]]; then
        echo "ERROR: Could not determine field count" >> "$log_file"
        ((errors++))
    else
        local line_num=0
        while IFS= read -r line; do
            ((line_num++))
            [[ -z "$line" ]] && continue
            [[ "$line" =~ ^# ]] && continue
            
            local current_fields
            current_fields=$(echo "$line" | awk -F"$separator" '{print NF}')
            
            if [[ $current_fields -ne $expected_fields ]]; then
                echo "WARNING: Line $line_num has $current_fields fields, expected $expected_fields" >> "$log_file"
            fi
        done < "$input_file"
    fi
    
    # Check 3: Required columns presence (basic check for 'id' or 'date' if present in header)
    local header
    header=$(head -n 1 "$input_file")
    if echo "$header" | grep -qiE 'id|date|timestamp'; then
        echo "INFO: Found standard identifier columns" >> "$log_file"
    else
        echo "WARN: No standard identifier columns (id/date) found in header" >> "$log_file"
    fi
    
    if [[ $errors -eq 0 ]]; then
        return 0
    else
        return 1
    fi
}
