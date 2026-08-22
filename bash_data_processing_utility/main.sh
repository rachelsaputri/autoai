#!/bin/bash

###############################################################################
# Bash Data Processing Utility - Main Entry Point
###############################################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Source modules
source "$SCRIPT_DIR/parser.sh"
source "$SCRIPT_DIR/transformer.sh"
source "$SCRIPT_DIR/validator.sh"
source "$SCRIPT_DIR/reporter.sh"

# Default Configuration
INPUT_FILE=""
OUTPUT_FILE="output_processed.txt"
MODE="transform" # transform, validate, report
FIELD_SEPARATOR=","
LOG_LEVEL="INFO"

# Logging function
log() {
    local level=$1
    shift
    local message="$*"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [$level] $message"
}

# Usage function
usage() {
    echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    echo "  -i, --input FILE       Input file to process"
    echo "  -o, --output FILE      Output file path (default: output_processed.txt)"
    echo "  -m, --mode MODE        Processing mode: transform, validate, report (default: transform)"
    echo "  -s, --separator SEP    Field separator (default: ,)"
    echo "  -h, --help             Show this help message"
    exit 1
}

# Argument Parsing
while [[ $# -gt 0 ]]; do
    case $1 in
        -i|--input)
            INPUT_FILE="$2"
            shift 2
            ;;
        -o|--output)
            OUTPUT_FILE="$2"
            shift 2
            ;;
        -m|--mode)
            MODE="$2"
            shift 2
            ;;
        -s|--separator)
            FIELD_SEPARATOR="$2"
            shift 2
            ;;
        -h|--help)
            usage
            ;;
        *)
            log "WARN" "Unknown argument: $1"
            shift
            ;;
    esac
done

# Validate Inputs
if [[ -z "$INPUT_FILE" ]]; then
    log "ERROR" "Input file is required. Use --input <file>."
    usage
fi

if [[ ! -f "$INPUT_FILE" ]]; then
    log "ERROR" "Input file not found: $INPUT_FILE"
    exit 1
fi

# Main Processing Pipeline
log "INFO" "Starting Data Processing Pipeline..."
log "INFO" "Mode: $MODE | Input: $INPUT_FILE | Output: $OUTPUT_FILE"

case $MODE in
    transform)
        log "INFO" "Running Transformer Module..."
        run_transformer "$INPUT_FILE" "$OUTPUT_FILE" "$FIELD_SEPARATOR"
        ;;
    validate)
        log "INFO" "Running Validator Module..."
        VALIDATION_LOG=$(mktemp)
        if run_validator "$INPUT_FILE" "$VALIDATION_LOG" "$FIELD_SEPARATOR"; then
            log "INFO" "Validation passed successfully."
        else
            log "ERROR" "Validation failed. Check log: $VALIDATION_LOG"
        fi
        ;;
    report)
        log "INFO" "Running Reporter Module..."
        if run_reporter "$INPUT_FILE" "$OUTPUT_FILE" "$FIELD_SEPARATOR"; then
            log "INFO" "Report generated successfully."
        else
            log "ERROR" "Report generation failed."
        fi
        ;;
    *)
        log "ERROR" "Unknown mode: $MODE"
        exit 1
        ;;
esac

log "INFO" "Pipeline completed."
exit 0
