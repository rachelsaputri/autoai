#!/bin/csh -f

# validator.csh - Data validation module

# Global variables
set -g valid_records = ""
set -g invalid_records = ""
set -g validation_errors = 0

alias validate_data 'validate_input_data'

proc validate_input_data
    if ( "$transformed_data" == "" ) then
        echo "No data to validate."
        return
    endif
    
    set line_num = 0
    set valid_count = 0
    set invalid_count = 0
    
    set lines = `echo "$transformed_data" | tail -n +2`
    
    foreach line ( $lines )
        if ( "\"$line\"" == "\"\"" ) then
            continue
        endif
        
        set line_num = `expr $line_num + 1`
        set is_valid = 1
        set error_msg = ""
        
        # Validation Rule 1: Check for non-empty fields
        set field_count = `echo $line | awk -F',' '{print NF}'`
        if ( $field_count < 1 ) then
            set is_valid = 0
            set error_msg = "Empty fields detected"
        endif
        
        if ( $is_valid ) then
            set valid_count = `expr $valid_count + 1`
            set valid_records = "$valid_records\n$line"
        else
            set invalid_count = `expr $invalid_count + 1`
            set invalid_records = "$invalid_records\n$line | Error: $error_msg"
            set validation_errors = `expr $validation_errors + 1`
        endif
    end
    
    echo "Validated $valid_count valid records, $invalid_count invalid records."
end
