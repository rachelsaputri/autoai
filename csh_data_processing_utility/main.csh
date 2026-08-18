#!/bin/csh -f

# main.csh - Main entry point for the C Shell Data Processing Utility

set script_dir = `dirname $0`
set script_dir = `cd $script_dir; pwd`

set INPUT_FILE = ""

# Parse command line arguments
if ( $#argv == 0 ) then
    echo "Usage: $0 <input_file>"
    echo "       $0 < <input_stream>"
    exit 1
endif

set INPUT_FILE = $argv[1]

if ( -f $INPUT_FILE ) then
    echo "Processing file: $INPUT_FILE"
    # Source modules
    source "$script_dir/parser.csh"
    source "$script_dir/transformer.csh"
    source "$script_dir/validator.csh"
    source "$script_dir/reporter.csh"
    
    # Run pipeline
    parse_data < $INPUT_FILE
    transform_data
    validate_data
    generate_report
else
    echo "Error: File $INPUT_FILE not found."
    exit 1
endif
