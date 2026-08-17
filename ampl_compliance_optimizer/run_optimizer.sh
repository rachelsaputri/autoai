#!/bin/bash
# AMPL Compliance Optimizer Runner
# Executes the AMPL model and formats results

MODEL="compliance_optimizer.mod"
DATA="compliance_optimizer.dat"
OUTPUT="optimizer_results.txt"

if ! command -v ampl &> /dev/null; then
    echo "ERROR: AMPL is not installed or not in PATH."
    echo "Please install AMPL before running this script."
    exit 1
fi

echo "[INFO] Running AMPL Compliance Optimization Engine..."
ampl -e "model $MODEL; data $DATA; solve; option solver cplex; solve; printf 'Results written to stdout.\n';"

if [ $? -eq 0 ]; then
    echo "[SUCCESS] Optimization completed successfully."
    echo "[OUTPUT] See console output for detailed risk assessment and control implementation recommendations."
else
    echo "[ERROR] Optimization failed. Check error logs and data constraints."
    exit 1
fi
