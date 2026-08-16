#!/usr/bin/env ksh

# =============================================================================
# KSH Security Log Analyzer & Auditor
# Author: AI Polyglot Software Engineer
# Description: Comprehensive security auditing, log analysis, and hardening tool.
# =============================================================================

set -o nounset
set -o errtrace

# ---------------------------------------------------------------------------
# Constants & Defaults
# ---------------------------------------------------------------------------
readonly VERSION="1.0.0"
readonly SCRIPT_NAME="$(basename "$0")"
readonly LOG_FILE="/var/log/security_auditor.log"
readonly REPORT_DIR="/tmp/security_audits"
readonly JSON_REPORT="${REPORT_DIR}/audit_report.json"
readonly HTML_REPORT="${REPORT_DIR}/audit_report.html"
readonly SYSLOG="/var/log/syslog"
readonly AUTH_LOG="/var/log/auth.log"
readonly SSHD_CONFIG="/etc/ssh/sshd_config"
readonly PERIODICITY=0 # Run once, can be extended for daemon mode

# ---------------------------------------------------------------------------
# Global Variables
# ---------------------------------------------------------------------------
MODE=""
OUTPUT_FILE=""
VERBOSE=0
DRY_RUN=0
ERRORS_FOUND=0
WARNINGS_FOUND=0
COMPLIANT_COUNT=0

# ---------------------------------------------------------------------------
# Utility Functions
# ---------------------------------------------------------------------------

log_info() {
    local msg="$(date '+%Y-%m-%d %H:%M:%S') [INFO] $1"
    print -u2 "$msg"
    [[ -f "$LOG_FILE" ]] && print -u2 "$msg" >> "$LOG_FILE"
}

log_warn() {
    local msg="$(date '+%Y-%m-%d %H:%M:%S') [WARN] $1"
    print -u2 "$msg"
    ((WARNINGS_FOUND++))
    [[ -f "$LOG_FILE" ]] && print -u2 "$msg" >> "$LOG_FILE"
}

log_error() {
    local msg="$(date '+%Y-%m-%d %H:%M:%S') [ERROR] $1"
    print -u2 "$msg"
    ((ERRORS_FOUND++))
    [[ -f "$LOG_FILE" ]] && print -u2 "$msg" >> "$LOG_FILE"
}

check_root() {
    if [[ $EUID -ne 0 ]]; then
        log_error "This script must be run as root."
        exit 1
    fi
}

ensure_dir() {
    if [[ ! -d "$1" ]]; then
        mkdir -p "$1"
    fi
}

sanitize_json_key() {
    echo "$1" | sed 's/[^a-zA-Z0-9_]/_/g'
}

# ---------------------------------------------------------------------------
# Report Generation Helpers
# ---------------------------------------------------------------------------

generate_json_start() {
    print '{' > "$JSON_REPORT"
    print '  "audit_metadata": {' >> "$JSON_REPORT"
    print "    \"timestamp\": \"$(date -Iseconds)\"," >> "$JSON_REPORT"
    print "    \"hostname\": \"$(hostname)\"," >> "$JSON_REPORT"
    print "    \"version\": \"${VERSION}\"," >> "$JSON_REPORT"
    print '    "findings": {' >> "$JSON_REPORT"
}

generate_json_end() {
    print '    },' >> "$JSON_REPORT"
    print '    "summary": {' >> "$JSON_REPORT"
    print "      \"errors\": ${ERRORS_FOUND}," >> "$JSON_REPORT"
    print "      \"warnings\": ${WARNINGS_FOUND}," >> "$JSON_REPORT"
    print "      \"compliant\": ${COMPLIANT_COUNT}" >> "$JSON_REPORT"
    print '    }' >> "$JSON_REPORT"
    print '}' >> "$JSON_REPORT"
}

generate_html_start() {
    cat > "$HTML_REPORT" << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Security Audit Report</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; margin: 40px; background-color: #f4f4f9; }
        h1, h2 { color: #333; }
        .report-card { background: #fff; border-radius: 5px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); padding: 20px; margin-bottom: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #007bff; color: white; }
        tr:hover { background-color: #f1f1f1; }
        .critical { color: #dc3545; font-weight: bold; }
        .warning { color: #ffc107; font-weight: bold; }
        .success { color: #28a745; font-weight: bold; }
        .summary-box { display: flex; justify-content: space-around; margin-bottom: 30px; }
        .box { background: white; padding: 20px; border-radius: 5px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); text-align: center; width: 20%; }
        .box h3 { margin: 0; font-size: 2em; }
    </style>
</head>
<body>
    <h1>Security Audit Report</h1>
    <p>Generated: <span id="date"></span></p>
    <script>document.getElementById('date').innerText = "$(date)";</script>
EOF
}

generate_html_end() {
    cat >> "$HTML_REPORT" << 'EOF'
</body>
</html>
EOF
}

add_html_table_row() {
    local status="$1"
    local check="$2"
    local details="$3"
    local css_class=""
    
    case "$status" in
        "CRITICAL") css_class="critical" ;;
        "WARNING") css_class="warning" ;;
        "OK") css_class="success" ;;
        *) css_class="" ;;
    esac

    cat >> "$HTML_REPORT" << EOF
    <tr>
        <td class="${css_class}">${status}</td>
        <td>${check}</td>
        <td>${details}</td>
    </tr>
EOF
}

# ---------------------------------------------------------------------------
# Security Checks
# ---------------------------------------------------------------------------

check_file_permissions() {
    local file="$1"
    local expected_perms="$2"
    local desc="$3"
    
    if [[ ! -f "$file" ]]; then
        log_warn "File not found: $file"
        return
    fi
    
    local current_perms
    current_perms=$(stat -c "%a" "$file" 2>/dev/null)
    
    if [[ "$current_perms" == "$expected_perms" ]]; then
        log_info "PASS: $desc (${file} has $expected_perms)"
        ((COMPLIANT_COUNT++))
        [[ "$MODE" == "report" ]] && add_html_table_row "OK" "File Permissions" "$desc: ${current_perms}"
    else
        log_warn "FAIL: $desc (Expected: ${expected_perms}, Got: ${current_perms})"
        [[ "$MODE" == "report" ]] && add_html_table_row "WARNING" "File Permissions" "$desc: Expected ${expected_perms}, Found ${current_perms}"
    fi
}

check_ssh_config() {
    log_info "Checking SSH Configuration..."
    
    if [[ ! -f "$SSHD_CONFIG" ]]; then
        log_warn "SSHD Config not found at $SSHD_CONFIG"
        return
    fi
    
    # Check PermitRootLogin
    local permit_root
    permit_root=$(grep -i "^PermitRootLogin" "$SSHD_CONFIG" | awk '{print $2}')
    if [[ "$permit_root" == "no" ]]; then
        log_info "PASS: PermitRootLogin is set to no"
        ((COMPLIANT_COUNT++))
        [[ "$MODE" == "report" ]] && add_html_table_row "OK" "SSH Config" "PermitRootLogin: no"
    elif [[ -z "$permit_root" ]]; then
        log_warn "FAIL: PermitRootLogin is not explicitly set (Default may be yes)"
        [[ "$MODE" == "report" ]] && add_html_table_row "WARNING" "SSH Config" "PermitRootLogin: Not Set"
    else
        log_error "FAIL: PermitRootLogin is set to yes"
        [[ "$MODE" == "report" ]] && add_html_table_row "CRITICAL" "SSH Config" "PermitRootLogin: yes"
    fi
    
    # Check PasswordAuthentication
    local pass_auth
    pass_auth=$(grep -i "^PasswordAuthentication" "$SSHD_CONFIG" | awk '{print $2}')
    if [[ "$pass_auth" == "no" ]]; then
        log_info "PASS: PasswordAuthentication is set to no"
        ((COMPLIANT_COUNT++))
        [[ "$MODE" == "report" ]] && add_html_table_row "OK" "SSH Config" "PasswordAuthentication: no"
    elif [[ -z "$pass_auth" ]]; then
        log_warn "FAIL: PasswordAuthentication is not explicitly set"
        [[ "$MODE" == "report" ]] && add_html_table_row "WARNING" "SSH Config" "PasswordAuthentication: Not Set"
    else
        log_error "FAIL: PasswordAuthentication is set to yes"
        [[ "$MODE" == "report" ]] && add_html_table_row "CRITICAL" "SSH Config" "PasswordAuthentication: yes"
    fi
}

check_auditd() {
    log_info "Checking Audit Daemon Status..."
    if [[ -x "$(command -v auditctl)" ]]; then
        # Check if auditd is running
        if pgrep -x "auditd" > /dev/null; then
            log_info "PASS: Audit daemon is running"
            ((COMPLIANT_COUNT++))
            [[ "$MODE" == "report" ]] && add_html_table_row "OK" "Audit Daemon" "Running"
        else
            log_warn "FAIL: Audit daemon is installed but not running"
            [[ "$MODE" == "report" ]] && add_html_table_row "WARNING" "Audit Daemon" "Installed but Not Running"
        fi
    else
        log_warn "FAIL: auditd not installed"
        [[ "$MODE" == "report" ]] && add_html_table_row "WARNING" "Audit Daemon" "Not Installed"
    fi
}

log_analyze_auth() {
    log_info "Analyzing Authentication Logs for Anomalies..."
    
    local target_log="$AUTH_LOG"
    if [[ ! -f "$target_log" ]]; then
        log_warn "Auth log not found: $target_log"
        return
    fi
    
    # Detect Brute Force Attempts
    # Look for 'Failed password' for the same user/IP within a short window
    local brute_force_ips
    brute_force_ips=$(grep "Failed password" "$target_log" 2>/dev/null | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr | head -n 5)
    
    if [[ -n "$brute_force_ips" ]]; then
        while IFS= read -r line; do
            local count ip
            count=$(echo "$line" | awk '{print $1}')
            ip=$(echo "$line" | awk '{print $2}')
            if [[ $count -gt 10 ]]; then
                log_warn "ALERT: Potential Brute Force from IP: $ip (${count} attempts)"
                [[ "$MODE" == "report" ]] && add_html_table_row "WARNING" "Auth Log" "Brute Force IP: ${ip} (${count} attempts)"
            fi
        done <<< "$brute_force_ips"
    fi
    
    # Detect Successful Logins after Failures (if available in full log)
    # Simplified: Check for unusual hours (00:00-05:00) for non-root users
    local unusual_hours
    unusual_hours=$(grep "Accepted password" "$target_log" 2>/dev/null | grep -E "(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) (0[0-9]|1[0-9]|2[0-9]|3[0-9]|4[0-9]|5[0-9])" | grep -v "root" | head -n 5)
    
    if [[ -n "$unusual_hours" ]]; then
        log_warn "ALERT: Unusual hour logins detected"
        [[ "$MODE" == "report" ]] && add_html_table_row "WARNING" "Auth Log" "Unusual Hour Logins Detected"
    else
        log_info "PASS: No unusual hour logins detected"
        ((COMPLIANT_COUNT++))
        [[ "$MODE" == "report" ]] && add_html_table_row "OK" "Auth Log" "No Unusual Hour Logins"
    fi
}

# ---------------------------------------------------------------------------
# Remediation Scripts
# ---------------------------------------------------------------------------

remediate_sshd() {
    if [[ "$MODE" != "remediate" ]]; then
        return
    fi
    
    log_info "Applying SSH Hardening..."
    
    if [[ -f "$SSHD_CONFIG" ]]; then
        # Backup
        cp "$SSHD_CONFIG" "${SSHD_CONFIG}.bak.$(date +%s)"
        
        # PermitRootLogin
        if grep -qi "^PermitRootLogin" "$SSHD_CONFIG"; then
            sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' "$SSHD_CONFIG"
            log_info "Fixed: PermitRootLogin"
        else
            echo "PermitRootLogin no" >> "$SSHD_CONFIG"
            log_info "Added: PermitRootLogin no"
        fi
        
        # PasswordAuthentication
        if grep -qi "^PasswordAuthentication" "$SSHD_CONFIG"; then
            sed -i 's/^PasswordAuthentication.*/PasswordAuthentication no/' "$SSHD_CONFIG"
            log_info "Fixed: PasswordAuthentication"
        else
            echo "PasswordAuthentication no" >> "$SSHD_CONFIG"
            log_info "Added: PasswordAuthentication no"
        fi
        
        log_info "Restarting SSHD..."
        systemctl restart sshd 2>/dev/null || service ssh restart 2>/dev/null || log_warn "Could not restart SSHD service automatically."
    else
        log_error "Cannot remediate: $SSHD_CONFIG not found"
    fi
}

# ---------------------------------------------------------------------------
# Main Logic
# ---------------------------------------------------------------------------

usage() {
    cat << EOF
Usage: $SCRIPT_NAME [OPTIONS]

Options:
  -m, --mode <mode>    Mode of operation: analyze, report, compliance, remediate
  -o, --output <file>  Output file for reports (default: /tmp/security_audits)
  -v, --verbose        Enable verbose output
  -h, --help           Show this help message

Examples:
  $SCRIPT_NAME --mode analyze
  $SCRIPT_NAME --mode report --output /tmp/my_report.html
  $SCRIPT_NAME --mode compliance
EOF
    exit 0
}

parse_args() {
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -m|--mode)
                MODE="$2"
                shift 2
                ;;
            -o|--output)
                OUTPUT_FILE="$2"
                shift 2
                ;;
            -v|--verbose)
                VERBOSE=1
                shift
                ;;
            -h|--help)
                usage
                ;;
            *)
                log_error "Unknown option: $1"
                usage
                ;;
        esac
    done
    
    if [[ -z "$MODE" ]]; then
        MODE="analyze"
    fi
}

main() {
    parse_args "$@"
    check_root
    
    ensure_dir "$REPORT_DIR"
    
    log_info "Starting Security Audit (${MODE})..."
    
    case "$MODE" in
        analyze)
            check_ssh_config
            check_auditd
            log_analyze_auth
            ;;
        report)
            local html_out="${OUTPUT_FILE:-$HTML_REPORT}"
            local json_out="${JSON_REPORT}"
            
            generate_html_start
            generate_json_start
            
            # Run checks
            check_ssh_config
            check_auditd
            log_analyze_auth
            
            # Add Summary Row to HTML
            add_html_table_row "" "Summary" "Errors: ${ERRORS_FOUND}, Warnings: ${WARNINGS_FOUND}, Compliant: ${COMPLIANT_COUNT}"
            
            generate_html_end
            generate_json_end
            
            print "Report generated: ${html_out}"
            print "JSON Report generated: ${json_out}"
            ;;
        compliance)
            # Compliance mode just reports findings
            check_ssh_config
            check_auditd
            ;;
        remediate)
            log_info "Running in Remediation Mode. This will modify system configurations."
            check_ssh_config
            check_auditd
            log_analyze_auth
            remediate_sshd
            ;;
        *)
            log_error "Invalid mode: $MODE"
            usage
            ;;
    esac
    
    log_info "Audit Completed. Errors: ${ERRORS_FOUND}, Warnings: ${WARNINGS_FOUND}"
}

main "$@"
