REBOL [
    Title: "Engine Configuration"
    Version: 1.0.0
    Description: "Configuration file for the REBOL Dynamic Policy Engine."
]

; Network Endpoints
CONFIG: [
    alert-source: "http://localhost:8080/alerts"
    orchestrator-url: "http://localhost:9090/remediation"
    log-file: %engine.log
]

; Logging
LOG-LEVEL: "info"

; Security
ENCRYPTION: on
SECURE-PROTOCOLS: [https ssl tls]

; Performance
THREADS: 4
TIMEOUT: 30
