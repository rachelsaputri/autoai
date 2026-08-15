#!/bin/bash
# run_verification.sh
# Entry script for the Candle Formal Policy Verifier.
# Handles compilation, execution, and logging.

set -e

POLICY_PATH="${1:-policies/default.json}"
STATE_PATH="${2:-states/default.json}"
OUTPUT_DIR="output"
TIMEOUT=300

echo "Starting Candle Formal Policy Verifier..."
echo "Policy Path: $POLICY_PATH"
echo "State Path: $STATE_PATH"
echo "Output Directory: $OUTPUT_DIR"

mkdir -p "$OUTPUT_DIR"

# Compile Candle source files
echo "Compiling Candle sources..."
candlec main.candle policy_spec.candle constraint_validator.candle state_invariant.candle proof_generator.candle types.candle config.candle -o verifier

# Run verification
echo "Running verification engine..."
./verifier --policy "$POLICY_PATH" --states "$STATE_PATH" --timeout $TIMEOUT --output "$OUTPUT_DIR"

echo "Verification complete. Check output directory for reports."
exit 0
