#!/usr/bin/env bash
# log_pipeline.sh - Configures log rotation and centralized ingestion
source "${SCRIPT_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}/config.env"

configure_log_pipeline() {
    log_msg INFO "Configuring log rotation for ${SERVICE_LIST}..."
    mkdir -p "${LOG_DIR}/archive"
    
    local log_conf="/etc/logrotate.d/telemetry_orchestrator"
    cat > "${log_conf}" <<EOF
${LOG_DIR}/*.log {
    daily
    rotate 7
    compress
    delaycompress
    missingok
    notifempty
    create 0640 root root
    dateext
    postrotate
        ${SCRIPT_DIR}/main.sh rotate > /dev/null 2>&1 || true
    endscript
}
EOF
    
    log_msg INFO "Logrotate configuration written to ${log_conf}"
    log_msg INFO "Log ingestion pipeline active at ${LOG_DIR}"
}

run_healthcheck() {
    log_msg INFO "Initializing periodic healthchecks..."
    # In production, this would be wrapped in a systemd timer or cron
    # For now, we perform an immediate check
    check_services_status
}

export -f configure_log_pipeline
export -f run_healthcheck
