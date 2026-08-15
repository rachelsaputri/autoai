REBOL [
    Title: "Security Policies"
    Version: 1.0.0
    Description: "Default security policies for the REBOL Dynamic Policy Engine."
]

POLICIES: reduce [
    ; Policy 1: Malware Detection
    make object! [
        name: "Malware Detection"
        conditions: [
            alert-type: "malware"
            source: "any"
        ]
        action: [
            command: "quarantine"
            target: "endpoint"
            parameters: "full-scan"
        ]
    ]
    ; Policy 2: Brute Force Attack
    make object! [
        name: "Brute Force Protection"
        conditions: [
            alert-type: "brute-force"
            source: "web-app"
        ]
        action: [
            command: "block-ip"
            target: "firewall"
            parameters: "temporary"
        ]
    ]
    ; Policy 3: Data Exfiltration
    make object! [
        name: "Data Exfiltration Prevention"
        conditions: [
            alert-type: "data-exfil"
            source: "any"
        ]
        action: [
            command: "notify-admin"
            target: "admin"
            parameters: "immediate"
        ]
    ]
]
