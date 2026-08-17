#!/bin/bash
#
# Self-Healing Tool for Edge Cases and Errors
# This script monitors a target directory for anomalies, detects configuration drift,
# handles file corruption, and automatically attempts to remediate issues.
#

set -euo pipefail

# Configuration
TARGET_DIR="${1:-.}"
LOG_FILE="${TARGET_DIR}/self_healing.log"
STATE_DIR="${TARGET_DIR}/.self_healing_state"
QUARANTINE_DIR="${TARGET_DIR}/.quarantine"
RECOVERY_MODE="${2:-manual}" # manual or auto

# Initialize directories
mkdir -p "${STATE_DIR}" "${QUARANTINE_DIR}"

# Logging function
log() {
    local level="$1"
    shift
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[${timestamp}] [${level}] $*" | tee -a "${LOG_FILE}"
}

# Hash a file for integrity checking
get_hash() {
    if command -v sha256sum &> /dev/null; then
        sha256sum "$1" | awk '{print $1}'
    elif command -v shasum &> /dev/null; then
        shasum -a 256 "$1" | awk '{print $1}'
    else
        md5sum "$1" | awk '{print $1}'
    fi
}

# Backup a file
backup_file() {
    local file="$1"
    local basename=$(basename "$file")
    local timestamp=$(date '+%Y%m%d_%H%M%S')
    cp -p "$file" "${QUARANTINE_DIR}/${basename}.${timestamp}"
    log "INFO" "Backed up ${file} to ${QUARANTINE_DIR}/${basename}.${timestamp}"
}

# Check file integrity against state database
check_integrity() {
    local file="$1"
    if [ ! -f "$file" ]; then
        return 0
    fi

    local current_hash=$(get_hash "$file")
    local stored_hash_file="${STATE_DIR}/$(basename "$file").hash"

    if [ -f "$stored_hash_file" ]; then
        local stored_hash=$(cat "$stored_hash_file")
        if [ "$current_hash" != "$stored_hash" ]; then
            log "WARNING" "Integrity violation detected in ${file}. Hash mismatch."
            return 1
        fi
    else
        # New file, record hash
        echo "$current_hash" > "$stored_hash_file"
        log "INFO" "Recorded hash for new file ${file}"
    fi
    return 0
}

# Handle corrupted file (e.g., empty or unreadable)
handle_corrupted_file() {
    local file="$1"
    log "WARNING" "Attempting to handle potentially corrupted file: ${file}"

    # Check if file is empty
    if [ ! -s "$file" ]; then
        log "INFO" "File is empty. Attempting recovery from backup if available."
        # In a real scenario, this would restore from a previous backup or template
        echo "# Recovered file at $(date)" > "$file"
        log "INFO" "Recreated empty file: ${file}"
        return 0
    fi

    # Check for binary garbage in text files (simple heuristic)
    if file "$file" | grep -q "text"; then
        if grep -qP '[\x00-\x08\x0E-\x1F]' "$file" 2>/dev/null; then
            log "WARNING" "Binary data detected in text file ${file}. Quarantining."
            backup_file "$file"
            rm -f "$file"
            return 1
        fi
    fi

    return 0
}

# Handle missing dependencies or broken symlinks
handle_broken_symlink() {
    local file="$1"
    if [ -L "$file" ] && [ ! -e "$file" ]; then
        log "WARNING" "Broken symlink detected: ${file}. Removing."
        rm -f "$file"
        return 0
    fi
    return 0
}

# Main scan function
scan_directory() {
    log "INFO" "Starting self-healing scan of ${TARGET_DIR}"
    local errors=0

    # Find all files
    while IFS= read -r -d '' file; do
        # Skip hidden directories and state directories
        if [[ "$file" == *"${STATE_DIR}"* ]] || [[ "$file" == *"${QUARANTINE_DIR}"* ]]; then
            continue
        fi

        # Check for broken symlinks
        if ! handle_broken_symlink "$file"; then
            ((errors++))
        fi

        # Check integrity
        if ! check_integrity "$file"; then
            log "WARNING" "Remediating file: ${file}"
            if [ "$RECOVERY_MODE" = "auto" ]; then
                # In auto mode, we might try to restore from a git repo or backup
                # For this example, we just backup and remove to force recreation
                backup_file "$file"
                rm -f "$file"
                log "INFO" "Removed ${file} for recreation/restore"
            else
                log "INFO" "Manual intervention required for: ${file}"
            fi
            ((errors++))
        fi

        # Check for corruption
        if ! handle_corrupted_file "$file"; then
            ((errors++))
        fi

    done < <(find "${TARGET_DIR}" -type f -print0 2>/dev/null)

    log "INFO" "Scan complete. Errors encountered: ${errors}"
    return $errors
}

# Create a baseline state
create_baseline() {
    log "INFO" "Creating baseline state in ${STATE_DIR}"
    while IFS= read -r -d '' file; do
        if [[ "$file" != *"${STATE_DIR}"* ]] && [[ "$file" != *"${QUARANTINE_DIR}"* ]]; then
            local basename=$(basename "$file")
            local hash=$(get_hash "$file")
            echo "$hash" > "${STATE_DIR}/${basename}.hash"
        fi
    done < <(find "${TARGET_DIR}" -type f -print0 2>/dev/null)
    log "INFO" "Baseline created."
}

# Main execution
main() {
    local command="${1:-scan}"

    case "$command" in
        scan)
            scan_directory
            ;;
        baseline)
            create_baseline
            ;;
        clean)
            log "INFO" "Cleaning up old quarantine files"
            find "${QUARANTINE_DIR}" -type f -mtime +30 -delete
            log "INFO" "Quarantine cleanup complete"
            ;;
        *)
            echo "Usage: $0 {scan|baseline|clean} [target_dir] [recovery_mode]"
            exit 1
            ;;
    esac
}

# Allow running as main if not sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
