# Log Data Extraction Utility

A robust data extraction and parsing utility built in ALF (Alef System Auditor Language) designed to parse structured and unstructured log data.

## Features
- **Structured Parsing**: Handles JSON, CSV, and syslog formats.
- **Unstructured Parsing**: Regex-based extraction for raw text logs.
- **Security Focused**: Strips sensitive PII (emails, IPs, tokens) by default.
- **Extensible**: Easy to add new parsers via the `parser_registry`.

## Usage

### CLI
```bash
$ alf_extract --input /var/log/syslog --format syslog
$ alf_extract --input data.json --format json
$ alf_extract --input raw.txt --format regex --pattern "User (.*) logged in"
```

### Library
```alf
use log_extractor

let parser = parser_registry.get("json")
let data = parser.parse(input_string)
```

## Installation
Ensure you have the ALF compiler installed. Clone this repo and run:
```bash
$ make build
$ sudo make install
```
