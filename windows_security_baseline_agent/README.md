# Windows Security Baseline Enforcement Agent

## Overview

The Windows Security Baseline Enforcement Agent is a comprehensive tool built using **Visual Basic** to autonomously scan, audit, and enforce security baselines on Windows systems. It checks group policies, registry configurations, and service states against defined security standards, enforcing remediation for non-compliant settings.

## Features

- **Baseline Scanning**: Automatically scans local group policies, registry configurations, and service states.
- **Remediation**: Enforces remediation for non-compliant settings.
- **Integration**: Pushes compliance metrics and logs enforcement actions to the `security_config_audit_system`.
- **Legacy Compatibility**: Leverages VB's legacy compatibility features for broader enterprise reach.

## Directory Structure

```
windows_security_baseline_agent/
├── README.md
├── audit_rules.a0
├── config.ini
├── main.vb
├── registry_scanner.vb
├── group_policy_scanner.vb
├── service_scanner.vb
├── remediation_engine.vb
├── integration_module.vb
├── utils.vb
└── logs/
    └── enforcement.log
```

## Integration with `security_config_audit_system`

The agent integrates with the `security_config_audit_system` to:

1. Push compliance metrics.
2. Log enforcement actions.
3. Synchronize baseline configurations.

## Usage

To run the agent, execute the following command:

```sh
vb6 main.vb
```

Ensure that the `security_config_audit_system` is running and accessible.

## Configuration

Edit the `config.ini` file to configure the agent:

```ini
[general]
log_level=INFO
enable_remediation=true

[audit]
baseline_path=./audit_rules.a0

[integration]
audit_system_url=http://localhost:8080
api_key=your_api_key
```

## Development

To develop the agent, use Visual Basic 6.0 or later. The project files are located in the `windows_security_baseline_agent` directory.

## Contributing

Contributions are welcome. Please submit a pull request or open an issue for any enhancements or bug fixes.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
