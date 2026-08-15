#!/usr/bin/awk -f
# sanitizer.awk
# Dedicated module for secure log sanitization before audit processing.
# Strips or masks PII, credentials, and internal network identifiers.

BEGIN {
    # Initialize masking dictionaries
    mask_pii["ssn"] = "XXX-XX-" substr($0, 7, 4)
    mask_cc = "XXXX-XXXX-XXXX-" substr($0, 15, 4)
    mask_token = "TOKEN_REDACTED"
}

{
    line = $0
    
    # Remove Social Security Numbers (format: 123-45-6789 or 123456789)
    gsub(/[0-9]{3}-[0-9]{2}-[0-9]{4}/, "XXX-XX-" substr($0, 12, 4), line)
    gsub(/[0-9]{9}/, "" , line)
    
    # Remove Credit Card Numbers (Luhn-validating regex is complex, use length-based)
    gsub(/[0-9]{4}[- ]?[0-9]{4}[- ]?[0-9]{4}[- ]?[0-9]{4}/, "XXXX-XXXX-XXXX-XXXX", line)
    
    # Mask API Keys, Tokens, and Passwords
    gsub(/[Aa]pi[_-]?[Kk]ey[:= ]+[A-Za-z0-9]{16,}/, "API_KEY=REDACTED", line)
    gsub(/[Tt]oken[:= ]+[A-Za-z0-9\.\-]{16,}/, "TOKEN=REDACTED", line)
    gsub(/[Pp][Aa][Ss][Ss][Ww][Oo][Rr][Dd][:= ]+[\S]+/, "PASSWORD=REDACTED", line)
    
    # Mask Email Addresses
    gsub(/[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}/, "EMAIL=REDACTED", line)
    
    # Mask IP Addresses (IPv4)
    gsub(/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/, "IP=REDACTED", line)
    
    # Mask IPv6 Addresses
    gsub(/[0-9a-fA-F]{1,4}(:[0-9a-fA-F]{1,4}){7}/, "IPV6=REDACTED", line)
    
    # Remove internal hostnames/domains (example: .internal.corp)
    gsub(/\.[iI]nternal\.[cC]orp/, ".REDACTED", line)
    
    print line
}
