# Genie Compliance Auditor

A comprehensive compliance auditing tool written in the Genie programming language. This tool provides a robust framework for checking system configurations, verifying user permissions, and generating detailed audit reports to ensure adherence to organizational security policies.

## Features

- **Policy Validation**: Checks system state against defined compliance rules.
- **Audit Logging**: Maintains a chronological log of all audit activities.
- **Reporting**: Generates detailed compliance reports in JSON format.
- **Real-time Monitoring**: Continuously monitors critical system components.

## Prerequisites

- **Genie Compiler**: Ensure `genie` is installed and in your PATH.
- **Gtk-3.0**: Genie typically relies on the GTK+ library for UI components, though this CLI tool minimizes UI dependency.
- **Gobject-Introspection**: Required for system library bindings.

## Usage

Compile the tool:
```bash
genie main.genie
```

Run the auditor:
```bash
./main [--config <path>] [--verbose]
```

## Architecture

- `main.genie`: Entry point, argument parsing, and orchestration.
- `audit_core.genie`: Core logic for policy evaluation and system inspection.
- `reporter.genie`: Handles formatting and output of audit results.
- `logger.genie`: Manages logging of audit events.

## License

MIT License
