#!/usr/bin/env bash
# main.sh - Entry point and command dispatcher for System Orchestrator
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/config.env"
source "${SCRIPT_DIR}/service_manager.sh"
source "${SCRIPT_DIR}/log_pipeline.sh"
source "${SCRIPT_DIR}/archival.sh"
source "${SCRIPT_DIR}/hardening.sh"
source "${SCRIPT_DIR}/healthcheck.sh"

LOG_FILE="${LOG_DIR}/orchestrator.log"

log_msg() {
    local level="$1"; shift
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [${level}] $*" | tee -a "${LOG_FILE}"
}

case "${1:-help}" in
    start)
        log_msg INFO "Starting service orchestration..."
        start_services
        log_msg INFO "Services started. Beginning log pipeline..."
        configure_log_pipeline
        log_msg INFO "Healthchecks initialized."
        run_healthcheck
        ;;
    stop)
        log_msg WARN "Stopping service orchestration..."
        stop_services
        log_msg INFO "Orchestration stopped."
        ;;
    status)
        log_msg INFO "Checking service status..."
        check_services_status
        ;;
    rotate)
        log_msg INFO "Triggering log rotation..."
        configure_log_pipeline
        ;;
    archive)
        log_msg INFO "Triggering secure archival..."
        archive_logs
        ;;
    hardening)
        log_msg INFO "Running system hardening validation..."
        validate_hardening
        ;;
    healthcheck)
        log_msg INFO "Running manual healthcheck..."
        run_healthcheck
        ;;
    help|*)
        echo "Usage: $0 {start|stop|status|rotate|archive|hardening|healthcheck}"
        echo "  start       - Initialize all services, logs, and healthchecks"
        echo "  stop        - Gracefully stop all managed services"
        echo "  status      - Check current status of managed services"
        echo "  rotate      - Trigger log rotation and pipeline reconfiguration"
        echo "  archive     - Compress and hash old logs for archival"
        echo "  hardening   - Validate system security parameters against baseline"
        echo "  healthcheck - Run immediate health verification"
        ;;
esac

exit 0
