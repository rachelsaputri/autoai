#!/bin/csh -f

# reporter.csh - Data reporting module

alias generate_report 'generate_report_data'

proc generate_report_data
    echo "=== DATA PROCESSING REPORT ==="
    echo "Generated at: `date`"
    echo ""
    echo "--- Summary ---"
    echo "Total Valid Records: $valid_count"
    echo "Total Invalid Records: $invalid_count"
    echo ""
    echo "--- Valid Records ---"
    if ( "$valid_records" != "" ) then
        echo "$valid_records" | tail -n +2
    else
        echo "No valid records."
    endif
    echo ""
    echo "--- Invalid Records ---"
    if ( "$invalid_records" != "" ) then
        echo "$invalid_records" | tail -n +2
    else
        echo "No invalid records."
    endif
    echo ""
    echo "=== END OF REPORT ==="
end
