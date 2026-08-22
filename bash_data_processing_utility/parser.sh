#!/bin/bash

###############################################################################
# Bash Data Processing Utility - Parser Module
###############################################################################

# parse_fields: Splits a line into fields based on the separator
# Args: $1 = line, $2 = separator
# Outputs: Array of fields
parse_fields() {
    local line="$1"
    local sep="$2"
    
    # Replace separator with newline for easier parsing, then read into array
    local IFS="$sep"
    read -r -a fields <<< "$line"
    echo "${fields[@]}"
}

# extract_header: Extracts the header row from the first line of a file
# Args: $1 = file path
# Outputs: Header line
extract_header() {
    local file="$1"
    head -n 1 "$file"
}

# read_records: Reads file into an array of lines, skipping comments
# Args: $1 = file path
# Outputs: Lines of data
read_records() {
    local file="$1"
    grep -v '^#' "$file" | grep -v '^$'
}
