#!/bin/csh -f

# parser.csh - Data parsing module

# Global variables
set -g parsed_data = ""

alias parse_data 'parse_input_data'

proc parse_input_data
    set input_stream = "$<"
    set line_num = 0
    set valid_lines = 0
    set invalid_lines = 0
    
    # Read from input stream or file
    foreach line ( $input_stream )
        if ( "\"$line\"" == "\"\"" ) then
            continue
        endif
        
        set line_num = `expr $line_num + 1`
        
        # Basic parsing: split by comma
        set fields = `echo $line | awk -F',' '{print NF}'`
        
        if ( $fields > 0 ) then
            set valid_lines = `expr $valid_lines + 1`
            # Store parsed line (simple approach: just keep as string for now)
            set parsed_data = "$parsed_data\n$line"
        else
            set invalid_lines = `expr $invalid_lines + 1`
        endif
    end
    
    echo "Parsed $valid_lines valid lines, $invalid_lines invalid lines."
end
