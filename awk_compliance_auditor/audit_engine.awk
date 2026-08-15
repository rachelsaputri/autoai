#!/usr/bin/awk -f
# audit_engine.awk
# Core audit engine: Parses logs, routes to policy checker and sanitizer, aggregates findings.

BEGIN {
    IGNORECASE = 1
    log_count = 0
    error_count = 0
    warning_count = 0
    critical_count = 0
    compliant_count = 0
    non_compliant_count = 0
    report_timestamp = strftime("%Y-%m-%d %H:%M:%S", systime())
    OFS = "\t"
    # Load external policy rules if provided via -v policies=policy_rules.awk
    # We will rely on external rule definitions loaded via -f or -v
}

{
    log_count++
    line = $0
    
    # Sanitize line for analysis (strip sensitive data)
    sanitized_line = sanitize_data(line)
    
    # Extract key fields based on common log formats (timestamp, level, source, message)
    # Basic regex extraction for standard syslog-like or structured logs
    match(sanitized_line, /[0-9]{4}-[0-9]{2}-[0-9]{2}[T ][0-9]{2}:[0-9]{2}:[0-9]{2}/)
    timestamp = substr(sanitized_line, RSTART, RLENGTH)
    if (timestamp == "") timestamp = "UNKNOWN_TIMESTAMP"
    
    # Detect severity level
    severity = "INFO"
    if (sanitized_line ~ /ERROR|FATAL|CRITICAL|ALERT/) severity = "CRITICAL"
    else if (sanitized_line ~ /WARN|WARNING/) severity = "WARNING"
    else if (sanitized_line ~ /DEBUG|TRACE/) severity = "DEBUG"
    
    # Check against compliance policies
    policy_result = check_policy(sanitized_line, severity)
    
    if (policy_result == "FAIL") {
        non_compliant_count++
        if (severity == "CRITICAL") critical_count++
        else if (severity == "WARNING") warning_count++
        else error_count++
        
        # Record violation details
        violations[non_compliant_count] = timestamp " | " severity " | " policy_result " | " sanitized_line
    } else {
        compliant_count++
    }
    
    # Accumulate raw lines for final reporting if needed, or just count
}

END {
    print "=== AUDIT ENGINE REPORT ==="
    print "Generated: " report_timestamp
    print "Total Log Entries Processed: " log_count
    print "Compliant: " compliant_count
    print "Non-Compliant: " non_compliant_count
    print "Errors: " error_count
    print "Warnings: " warning_count
    print "Critical: " critical_count
    print "==========================="
    print ""
    print "VIOLATION DETAILS:"
    for (i = 1; i <= non_compliant_count; i++) {
        print violations[i]
    }
    if (non_compliant_count == 0) {
        print "No compliance violations detected."
    }
    print "\n=== END OF REPORT ==="
}

# Function to sanitize sensitive data using patterns defined externally or inline
function sanitize_data(data) {
    # Mask passwords/credentials
    gsub(/[Pp][Aa][Ss][Ss][Ww][Oo][Rr][Dd]="[^"]*"/, "PASSWORD=\"***REDACTED***\"", data)
    # Mask tokens/API keys
    gsub(/[Aa][Pp][Ii][Kk][Ee][Yy]\s*[:=]\s*[A-Za-z0-9]{32,}/, "APIKEY=***REDACTED***", data)
    # Mask email addresses
    gsub(/[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}/, "EMAIL=***REDACTED***", data)
    # Mask IP addresses (optional, depending on policy)
    gsub(/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/, "IP=***REDACTED***", data)
    return data
}

# Function to check policy against line (stubbed for external rule loading)
function check_policy(line, severity) {
    # In a full implementation, this would iterate over loaded rules
    # For now, we use inline deterministic rules for demonstration of full functionality
    if (line ~ /FAILED [Pp][Aa][Ss][Ss][Ww][Oo][Rr][Dd] CHANG[EE]/) return "FAIL: PASSWORD POLICY - Unapproved password change detected"
    if (line ~ /UNAUTHORIZED ACCESS TO [A-Z0-9_-]+/ && severity == "CRITICAL") return "FAIL: ACCESS POLICY - Critical unauthorized access"
    if (line ~ /SESSION TIMEOUT EXCEEDED/) return "FAIL: SESSION POLICY - Idle timeout exceeded"
    if (line ~ /CONFIGURATION [Dd]RIFT DETECTED/) return "FAIL: CONFIGURATION POLICY - Drift detected"
    # Default compliant
    return "PASS"
}
