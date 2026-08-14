#!/usr/bin/env bash
# archival.sh - Securely compresses and hashes old logs
source "${SCRIPT_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}/config.env"

archive_logs() {
    local timestamp
    timestamp=$(date '+%Y%m%d_%H%M%S')
    local archive_name="telemetry_logs_${timestamp}.tar.gz"
    local archive_path="${ARCHIVE_DIR}/${archive_name}"
    local manifest="${ARCHIVE_DIR}/${timestamp}.sha256"
    
    mkdir -p "${ARCHIVE_DIR}"
    
    if [ ! -d "${LOG_DIR}" ] || [ -z "$(ls -A ${LOG_DIR}/*.log 2>/dev/null)" ]; then
        log_msg WARN "No logs found to archive."
        return 0
    fi
    
    log_msg INFO "Archiving logs to ${archive_path}..."
    tar -czf "${archive_path}" -C "${LOG_DIR}" .
    
    log_msg INFO "Generating cryptographic manifest..."
    sha256sum "${archive_path}" > "${manifest}"
    
    log_msg INFO "Archival complete. Verify with: sha256sum -c ${manifest}"
}

export -f archive_logs
