REBOL [
    Title: "Configuration Defaults"
]

; Default Configuration
DEFAULT-BATCH-SIZE: 1000
DEFAULT-LOG-LEVEL: "INFO"
DEFAULT-OUTPUT-FORMAT: "txt"

; Logging Setup
log-level: DEFAULT-LOG-LEVEL

log-message: func [
    [catch]
    level [string!] "Log level"
    message [string!] "Message text"
]
[
    if find log-level level [print rejoin ["[" level "]" timestamp " " message]]
]

timestamp: func [
    "Returns current formatted timestamp"
]
[
    form now
]

; Exported defaults
export [
    DEFAULT-BATCH-SIZE
    DEFAULT-LOG-LEVEL
    DEFAULT-OUTPUT-FORMAT
    log-level
    log-message
]
