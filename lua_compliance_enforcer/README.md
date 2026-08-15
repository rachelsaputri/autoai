# Lua Compliance Enforcer

A lightweight, Lua-based automated compliance policy enforcement tool designed to integrate with existing audit and drift detection systems. This enforcer parses structured policy definitions, evaluates them against live system states, and triggers corrective actions or alerts based on policy deviations.

## Features
- **Policy Parsing**: Reads YAML/JSON policy definitions.
- **Configuration Drift Detection**: Cross-references system configurations against defined baselines.
- **Automated Enforcement**: Executes corrective scripts or flags deviations.
- **Alert Integration**: Formats output for seamless integration with `alert_correlation_persistence` and `config_drift_audit`.
- **Modular Design**: Built with Lua modules for easy extensibility.

## Requirements
- Lua 5.4+
- `luci.files` and `luci.json` libraries (or standard Lua libraries with manual parsing)
- Execution environment with read access to system logs and configurations.

## Usage
1. Define your compliance policies in the `policies/` directory using the provided JSON schema.
2. Run the enforcer:
   ```bash
   lua main.lua
   ```
3. Check the output reports in the `reports/` directory or forward them to your alerting system.

## Policy Schema
Policies are defined in JSON format:
```json
{
  "policy_id": "net-001",
  "description": "Ensure SSH port is non-standard",
  "check": {
    "type": "file_content",
    "path": "/etc/ssh/sshd_config",
    "pattern": "^Port 2222$"
  },
  "enforcement": {
    "type": "alert",
    "action": "notify_security_team"
  }
}
```

## Architecture
- `main.lua`: Entry point, orchestrates policy loading, evaluation, and reporting.
- `policy_loader.lua`: Handles parsing of policy definition files.
- `system_checker.lua`: Interfaces with OS to read configurations and logs.
- `enforcement_engine.lua`: Executes corrective actions or generates alerts.
- `reporter.lua`: Formats results for integration with external audit pipelines.

## Integration
This tool is designed to work alongside the workspace's existing Rust-based audit engines. Reports are generated as JSON and can be piped directly into the `config_drift_audit` pipeline or consumed by `alert_correlation_persistence` for correlation.
