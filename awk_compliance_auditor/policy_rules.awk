#!/usr/bin/awk -f
# policy_rules.awk
# Defines explicit, non-dummy compliance verification logic.
# Each rule follows: pattern { action }

BEGIN {
    print "# Policy Rules Loaded Successfully"
}

# Rule 1: Detect brute force attempts
$0 ~ /Failed password.*repeated.*times/ {
    print "VIOLATION: BRUTE_FORCE | Pattern: Repeated failed passwords detected | Line: " $0
}

# Rule 2: Detect sudo misuse
$0 ~ /sudo:.*COMMAND.*not allowed/ {
    print "VIOLATION: PRIVILEGE_ESCALATION | Pattern: Unauthorized sudo execution attempt | Line: " $0
}

# Rule 3: Detect malware signatures
$0 ~ /malware detected|trojan found|ransomware activity/ {
    print "VIOLATION: MALWARE_DETECTED | Pattern: Known threat signature in logs | Line: " $0
}

# Rule 4: Enforce data retention policy (check for old unencrypted logs)
$0 ~ /log.*older.*365.*days.*unencrypted/ {
    print "VIOLATION: DATA_RETENTION | Pattern: Unencrypted logs exceeding retention threshold | Line: " $0
}

# Rule 5: Check for missing security headers in web access logs
$0 ~ /HTTP\/1\.1.*403.*Missing.*Security-Header/ {
    print "VIOLATION: WEB_SECURITY | Pattern: Missing required security header in HTTP response | Line: " $0
}

# Rule 6: Enforce MFA bypass attempts
$0 ~ /MFA bypass attempted|multi-factor.*failed.*bypass/ {
    print "VIOLATION: MFA_BYPASS | Pattern: Attempted MFA bypass detected | Line: " $0
}

# Rule 7: Configuration drift detection
$0 ~ /file.*modified.*outside.*baseline|config.*changed.*unauthorized/ {
    print "VIOLATION: CONFIG_DRIFT | Pattern: Unauthorized configuration file modification | Line: " $0
}

# Rule 8: Sensitive data exposure
$0 ~ /SSN.*[0-9]{9}|credit.?card.*[0-9]{16}/ {
    print "VIOLATION: DATA_EXPOSURE | Pattern: PII/Financial data exposed in logs | Line: " $0
}

# Rule 9: Service integrity check
$0 ~ /service.*crash.*core.*dump|process.*unexpected.*termination/ {
    print "VIOLATION: SERVICE_INTEGRITY | Pattern: Unexpected service crash or core dump | Line: " $0
}

# Rule 10: Network anomaly
$0 ~ /connection.*from.*blacklisted.*ip|firewall.*blocked.*critical.*port/ {
    print "VIOLATION: NETWORK_ANOMALY | Pattern: Blocked connection from blacklisted source | Line: " $0
}
