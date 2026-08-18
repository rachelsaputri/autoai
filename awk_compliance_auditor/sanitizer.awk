# Data Sanitization Module
# This file contains rules for cleaning and normalizing input data

BEGIN {
    sanitized_status = ""
    sanitized_value = ""
}

function sanitize_status(raw_status) {
    # Convert to uppercase
    return toupper(raw_status)
}

function sanitize_value(raw_value) {
    # Remove any non-numeric characters
    gsub(/[^0-9.]/, "", raw_value)
    # Ensure it's a valid number
    return raw_value + 0
}
