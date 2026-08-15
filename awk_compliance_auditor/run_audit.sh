#!/bin/bash
# run_audit.sh
# Wrapper script to execute the AWK compliance auditor pipeline.
# Usage: ./run_audit.sh <input_log_file> [output_report_file]

set -e

AUDIT_DIR="$(cd "$(dirname "$0")" && pwd)"
INPUT_LOG="${1:?Usage: $0 <input_log_file> [output_report_file]}"
OUTPUT_FILE="${2:-audit_report.txt}"

if [ ! -f "$INPUT_LOG" ]; then
    echo "ERROR: Input log file '$INPUT_LOG' not found."
    exit 1
fi

echo "[INFO] Starting AWK Compliance Audit on: $INPUT_LOG"
echo "[INFO] Rules: $AUDIT_DIR/policy_rules.awk"
echo "[INFO] Sanitizer: $AUDIT_DIR/sanitizer.awk"
echo "[INFO] Engine: $AUDIT_DIR/audit_engine.awk"

# Step 1: Sanitize logs
SANITIZED_LOG=$(mktemp)
awk -f "$AUDIT_DIR/sanitizer.awk" "$INPUT_LOG" > "$SANITIZED_LOG"
echo "[INFO] Log sanitization complete."

# Step 2: Run audit engine with policy rules
awk -f "$AUDIT_DIR/audit_engine.awk" -v policy_file="$AUDIT_DIR/policy_rules.awk" "$SANITIZED_LOG" | tee "$OUTPUT_FILE"
echo "[INFO] Audit report generated at: $OUTPUT_FILE"

# Step 3: Cleanup
rm -f "$SANITIZED_LOG"
echo "[INFO] Cleanup complete."

exit 0
