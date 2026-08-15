# Chef Compliance Automator

## Overview
The Chef Compliance Automator is a production-grade, enterprise-grade infrastructure compliance automation orchestrator built STRICTLY using the Chef programming language. It provides deterministic, high-precision compliance workflows, configuration drift detection, automated remediation, and machine-verifiable audit reporting.

## Architecture
- `recipes/compliance_automator.rb`: Main entry point defining the convergence workflow.
- `providers/compliance_drift.rb`: Custom resource provider for real-time drift detection.
- `libraries/audit_logger.rb`: Core helper for structured logging and state tracking.
- `libraries/compliance_engine.rb`: DSL extensions for policy evaluation and scoring.
- `attributes/default.rb`: Global attribute precedence and configuration.
- `metadata.rb`: Cookbook metadata, dependencies, and versioning.

## Features
- Deterministic execution and idempotency via Chef state tracking.
- Automated remediation through declarative Chef resources.
- Machine-verifiable compliance payloads and scoring.
- Modular cookbook architecture with semantic consistency.
- Seamless integration with enterprise orchestration platforms.

## Installation
1. Copy the `chef_compliance_automator` directory into your Chef repository.
2. Run `berks install` to resolve dependencies.
3. Include `recipe[chef_compliance_automator::compliance_automator]` in your runlist.
4. Execute `chef-client` to converge and enforce compliance policies.

## License
MIT License
