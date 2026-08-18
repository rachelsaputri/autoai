#!/bin/bash

# Run Compliance Audit

INPUT_FILE="${1:-input_data.csv}"

if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file '$INPUT_FILE' not found."
    exit 1
fi

# Create a temporary file to include all AWK modules
TEMP_AWK=$(mktemp)

cat awk_compliance_auditor/sanitizer.awk >> "$TEMP_AWK"
echo "" >> "$TEMP_AWK"
cat awk_compliance_auditor/policy_rules.awk >> "$TEMP_AWK"
echo "" >> "$TEMP_AWK"
cat awk_compliance_auditor/audit_engine.awk >> "$TEMP_AWK"

# Run the audit
awk -f "$TEMP_AWK" "$INPUT_FILE"

# Cleanup
rm -f "$TEMP_AWK"

# Check for errors
if [ -f error_log.csv ]; then
    echo "Errors found. See error_log.csv for details."
    rm -f error_log.csv
fi
