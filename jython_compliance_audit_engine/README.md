# Jython Compliance Audit Engine

This is a standalone, fully functional compliance audit engine built exclusively with Jython. It is designed to parse system configurations, cross-reference them against a strict policy definition, and generate actionable audit reports.

## Features
- Policy Parser: Reads and validates YAML-based compliance rules.
- Configuration Auditor: Scans local files and system states against defined policies.
- Report Generator: Outputs detailed, human-readable compliance reports.
- Remediation Suggestions: Automatically generates configuration snippets to fix violations.

## Prerequisites
- Python 3.x
- `pyyaml` module

## Installation
```bash
pip install pyyaml
python3 audit_engine.py
```

## Usage
Place your policy file in `policies/` and your target configuration files in `configs/`. Run the engine from the root directory.
