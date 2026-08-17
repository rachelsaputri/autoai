# Arc-based Compliance Policy Verification Engine

## Overview
This tool is a comprehensive compliance policy verification engine written in Arc. It provides a robust framework for defining, parsing, and verifying compliance policies against system states and configuration data.

## Features
- **Policy Definition Engine**: Define complex compliance rules using a human-readable Arc syntax.
- **State Validation Engine**: Verify current system configurations against defined policies.
- **Drift Detection**: Automatically identify deviations from the expected compliance baseline.
- **Detailed Reporting**: Generate comprehensive audit trails and violation reports.
- **Remediation Suggestions**: Provide actionable recommendations for resolving compliance failures.

## Usage
1. Place your policy files in the `policies/` directory.
2. Place your system state/configuration files in the `state/` directory.
3. Run the verification engine.
4. Review the generated `audit_report.json` and `violation_summary.txt`.

## Policy Syntax Example
```arc
(define-policy "ssh-hardening")
  (condition "sshd_config")
  (rule "PermitRootLogin no")
  (rule "PasswordAuthentication no")
  (severity "high")
  (description "SSH must have root login and password auth disabled")
)
```

## State Format Example
```arc
(define-state "production-server-01")
  (load-file "/etc/ssh/sshd_config")
  (load-file "/etc/passwd")
  (load-file "/etc/ssh/ssh_host_rsa_key")
)
```

## Architecture
- `engine.arc`: Main entry point and orchestration logic.
- `parser.arc`: Policy syntax parser and compiler.
- `validator.arc`: Core state validation and rule evaluation logic.
- `reporter.arc`: Audit trail generation and formatting.

## Requirements
- Arc Language Compiler
- Standard Unix utilities (for file loading and basic operations)

## License
MIT License
