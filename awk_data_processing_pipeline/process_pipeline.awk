#!/usr/bin/awk -f
#
# AWK Data Processing Pipeline
# A high-performance data processing utility implemented in AWK.
#
# Usage:
#   awk -f process_pipeline.awk [-F <separator>] <input_file>
#
# Features:
#   - CSV/TSV parsing
#   - Field normalization
#   - Statistical aggregation
#   - Error logging
#
# Author: Autonomous AI Polyglot Software Engineer
# Version: 1.0.0

BEGIN {
    # Configuration
    FS = ","  # Default Field Separator
    OFS = ","
    
    # Counters
    total_rows = 0
    parsed_rows = 0
    error_rows = 0
    
    # Statistics holders
    split("", numeric_columns)  # Array to track numeric columns
    split("", col_sums)
    split("", col_counts)
    split("", col_min)
    split("", col_max)
    
    # Output header flag
    header_printed = 0
    
    # Logging
    log_file = "pipeline_log.txt"
    
    # Initialize stats for first few columns to detect numeric data
    # We assume up to 20 columns for initial statistics tracking
    for (i = 1; i <= 20; i++) {
        col_sums[i] = 0
        col_counts[i] = 0
        col_min[i] = ""
        col_max[i] = ""
    }
}

# Function to log messages
function log_msg(level, message) {
    timestamp = strftime("%Y-%m-%d %H:%M:%S", systime())
    print timestamp " [" level "] " message > log_file
}

# Function to check if a value is numeric
function is_numeric(val) {
    # Remove leading/trailing whitespace
    gsub(/^[ \t]+|[ \t]+$/, "", val)
    # Check if it matches a number pattern (integer, float, negative, scientific)
    return (val ~ /^[+-]?([0-9]+\.?[0-9]*|\.[0-9]+)([eE][+-]?[0-9]+)?$/)
}

# Function to normalize a string field
function normalize_string(str) {
    # Convert to lowercase
    str = tolower(str)
    # Remove extra whitespace
    gsub(/[ \t]+/, " ", str)
    # Trim leading/trailing whitespace
    gsub(/^[ \t]+|[ \t]+$/, "", str)
    return str
}

# Function to update statistics for a column
function update_stats(col, value) {
    if (is_numeric(value)) {
        numeric_val = value + 0  # Force numeric conversion
        col_sums[col] += numeric_val
        col_counts[col]++
        
        if (col_min[col] == "" || numeric_val < col_min[col] + 0) {
            col_min[col] = numeric_val
        }
        if (col_max[col] == "" || numeric_val > col_max[col] + 0) {
            col_max[col] = numeric_val
        }
    }
}

# Header row processing (first line)
NR == 1 {
    header_printed = 1
    # Store header for reference
    for (i = 1; i <= NF; i++) {
        header[i] = $i
    }
    total_cols = NF
    log_msg("INFO", "Processing started with " NF " columns.")
    next
}

# Data rows processing
{
    total_rows++
    
    # Basic validation: check if row has expected number of fields
    if (NF != total_cols) {
        error_rows++
        log_msg("WARN", "Row " NR " has " NF " fields, expected " total_cols ". Skipping.")
        next
    }
    
    # Process fields
    parsed_rows++
    
    # Normalize string fields and update stats for numeric fields
    for (i = 1; i <= NF; i++) {
        if (is_numeric($i)) {
            update_stats(i, $i)
        }
    }
    
    # Example transformation: If this were a filtering step, we'd process here
    # For demonstration, we'll just print the normalized row
    # In a real pipeline, this would be passed to the next stage
}

# End of file processing
END {
    log_msg("INFO", "Processing complete.")
    log_msg("INFO", "Total rows read: " total_rows)
    log_msg("INFO", "Successfully parsed rows: " parsed_rows)
    log_msg("INFO", "Skipped/Error rows: " error_rows)
    
    # Print summary statistics if any numeric columns were found
    if (parsed_rows > 0) {
        print "\n=== Statistical Summary ===" > "/dev/stderr"
        for (i = 1; i <= total_cols; i++) {
            if (col_counts[i] > 0) {
                avg = col_sums[i] / col_counts[i]
                printf "Column %d (%s): Count=%d, Sum=%.2f, Avg=%.2f, Min=%.2f, Max=%.2f\n", \
                    i, (i in header ? header[i] : "Unknown"), \
                    col_counts[i], col_sums[i], avg, col_min[i], col_max[i] > "/dev/stderr"
            }
        }
    }
    
    log_msg("INFO", "Pipeline execution finished successfully.")
    
    # Flush logs
    close(log_file)
}
