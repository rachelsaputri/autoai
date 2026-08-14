#!/usr/bin/env bash
# service_manager.sh - Handles daemon start/stop/status/restart
source "${SCRIPT_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}/config.env"

start_services() {
    local IFS=','
    for svc in ${SERVICE_LIST}; do
        if systemctl is-active --quiet "${svc}" 2>/dev/null; then
            log_msg INFO "Service ${svc} is already active."
        else
            log_msg INFO "Starting service ${svc}..."
            systemctl start "${svc}" || log_msg ERROR "Failed to start ${svc}"
        fi
    done
}

stop_services() {
    local IFS=','
    for svc in ${SERVICE_LIST}; do
        log_msg INFO "Stopping service ${svc}..."
        systemctl stop "${svc}" || log_msg WARN "Failed to stop ${svc}"
    done
}

check_services_status() {
    local IFS=','
    for svc in ${SERVICE_LIST}; do
        if systemctl is-active --quiet "${svc}" 2>/dev/null; then
            log_msg INFO "${svc}: ACTIVE"
        else
            log_msg ERROR "${svc}: INACTIVE"
        fi
    done
}

restart_service() {
    local svc="$1"
    log_msg INFO "Restarting service ${svc}..."
    systemctl restart "${svc}" || log_msg ERROR "Failed to restart ${svc}"
}

# Export functions if sourced
declare -f start_services
export -f start_services
export -f stop_services
export -f check_services_status
export -f restart_service
