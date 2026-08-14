#!/usr/bin/env bash
# healthcheck.sh - Monitors service status and resource usage
source "${SCRIPT_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}/config.env"

run_healthcheck() {
    log_msg INFO "=== Healthcheck Run: $(date) ==="
    check_services_status
    
    local disk_usage
    disk_usage=$(df -h "${LOG_DIR}" | awk 'NR==2 {print $5}' | tr -d '%')
    log_msg INFO "Log partition usage: ${disk_usage}%"
    
    if [ "${disk_usage}" -gt 90 ]; then
        log_msg ERROR "CRITICAL: Disk usage above 90%. Immediate archival required."
        archive_logs
    fi
    
    log_msg INFO "=== Healthcheck Complete ==="
}

export -f run_healthcheck
