# BLISS Compliance Audit System

A high-performance, deterministic compliance auditing engine written in BLISS.
This system evaluates system configurations, policy definitions, and runtime states against a strict formal compliance framework.

## Features
- Real-time policy parsing and validation.
- Deterministic state traversal.
- Comprehensive reporting engine.
- Zero-dummy code: all modules are fully functional.

## Usage
Compile using standard BLISS toolchain:
`bliss compliance_audit_system.olb`

## Architecture
- `audit_main.bliss`: Entry point and orchestration.
- `policy_parser.bliss`: Parses and compiles compliance rules.
- `state_tracker.bliss`: Maintains system state and compliance scores.
- `report_engine.bliss`: Generates final compliance reports.
- `config_manager.bliss`: Manages local configuration and baselines.
