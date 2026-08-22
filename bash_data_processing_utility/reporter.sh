#!/bin/bash

###############################################################################
# Bash Data Processing Utility - Reporter Module
###############################################################################

# run_reporter: Generates statistical reports
# Args: $1 = input file, $2 = output file, $3 = separator
run_reporter() {
    local input_file="$1"
    local output_file="$2"
    local separator="$3"
    
    local total_lines=0
    local valid_lines=0
    
    # Count total lines (excluding empty)
    total_lines=$(grep -cv '^$' "$input_file" 2>/dev/null || echo 0)
    
    # Count non-comment lines
    valid_lines=$(grep -cv '^#' "$input_file" 2>/dev/null || echo 0)
    
    # Calculate column count
    local header
    header=$(head -n 1 "$input_file")
    local col_count
    col_count=$(echo "$header" | awk -F"$separator" '{print NF}')
    
    # Generate Summary
    {
        echo "========================================"
        echo "       DATA PROCESSING REPORT          "
        echo "========================================"
        echo "Generated At: $(date)"
        echo "Source File: $input_file"
        echo "----------------------------------------"
        echo "Total Non-Empty Lines: $total_lines"
        echo "Valid Data Lines: $valid_lines"
        echo "Column Count: $col_count"
        echo "----------------------------------------"
        
        # Word Count per line
        echo "Average Words Per Line:"
        if [[ $valid_lines -gt 0 ]]; then
            local total_words
            total_words=$(awk '{print NF}' "$input_file" | awk '{s+=$1} END {print s}')
            echo "$total_words" | awk -v lines="$valid_lines" '{printf "%.2f\n", $1/lines}'
        else
            echo "0"
        fi
        
        echo "========================================"
    } > "$output_file"
    
    cat "$output_file"
    return 0
}
