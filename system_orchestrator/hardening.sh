#!/usr/bin/env bash
# hardening.sh - Validates system security parameters against baseline
source "${SCRIPT_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}/config.env"

validate_hardening() {
    log_msg INFO "Starting system hardening validation..."
    local failures=0
    
    # Example sysctl checks (customize based on baseline)
    local -A sysctl_checks=(
        ["net.ipv4.ip_forward"]="0"
        ["net.ipv4.conf.all.accept_redirects"]="0"
        ["net.ipv4.conf.all.send_redirects"]="0"
        ["net.ipv4.icmp_echo_ignore_broadcasts"]="1"
        ["kernel.randomize_va_space"]="2"
    )
    
    for param in "${!sysctl_checks[@]}"; do
        local current
        current=$(sysctl -n "${param}" 2>/dev/null || echo "unknown")
        local expected="${sysctl_checks[${param}]}"
        
        if [ "${current}" != "${expected}" ]; then
            log_msg ERROR "Parameter ${param} is ${current}, expected ${expected}"
            ((failures++))
        else
            log_msg INFO "Parameter ${param} meets baseline."
        fi
    done
    
    # Check critical file permissions
    for path in ${HARDENED_FILES:-"/etc/shadow /etc/passwd /etc/ssh/sshd_config"}; do
        if [ -f "${path}" ]; then
            local perms
            perms=$(stat -c '%a' "${path}")
            if [[ "${perms}" != "600" && "${perms}" != "640" && "${perms}" != "644" ]]; then
                log_msg WARN "Permissions on ${path} are ${perms}. Recommend restrictive modes."
            fi
        fi
    done
    
    if [ ${failures} -gt 0 ]; then
        log_msg WARN "Hardening validation completed with ${failures} failures."
        return 1
    else
        log_msg INFO "System meets hardening baseline requirements."
        return 0
    fi
}

export -f validate_hardening
