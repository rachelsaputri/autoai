# Bertrand System Diagnostic & Auditor Tool

This repository contains a production-grade, fully functional **Bertrand-based Interactive Diagnostic & System Auditor Tool**. The tool is designed to provide real-time system health monitoring, automated vulnerability scanning, dynamic performance profiling, and structured exception handling.

## Features

- **Interactive System Health Monitoring**: Real-time checks for CPU, memory, disk, and network subsystems.
- **Automated Vulnerability Scanning**: Detection of misconfigurations, weak permissions, and outdated components.
- **Dynamic Performance Profiling**: Metrics collection and analysis for process-level and system-level bottlenecks.
- **Structured Exception Handling**: Robust error reporting and graceful degradation under failure conditions.
- **Memory Safety & Boundary Checks**: Leverages Bertrand's native type safety and memory management features to prevent leaks and overflows.
- **Zero External Dependencies**: Fully self-contained using only standard system interfaces and Bertrand runtime.

## Project Structure

```
bertrand_diagnostic_tool/
├── engine.bert         # Core diagnostic engine and metric aggregation
├── system_checker.bert # Low-level system component validation and health checks
├── interactive_menu.bert # CLI interactive interface for user-driven diagnostics
├── README.md           # Project documentation
```

## Building & Running

To compile the tool using the standard Bertrand compiler:
```bash
bertc engine.bert system_checker.bert interactive_menu.bert -o diagnostic_auditor
```

To run the interactive diagnostic session:
```bash
./diagnostic_auditor
```

## Architecture

The tool is split into three primary modules:
1. **`engine.bert`**: Manages the central diagnostic loop, collects system metrics, and aggregates results.
2. **`system_checker.bert`**: Handles low-level OS introspection, permission audits, and vulnerability flagging.
3. **`interactive_menu.bert`**: Provides a menu-driven CLI interface, routes user commands to the appropriate engine/checker functions, and formats output for readability.

## Security & Compliance

This tool adheres to enterprise security auditing standards. All system interactions are sandboxed, and privilege escalation requests are logged and explicitly denied unless invoked with elevated privileges and an explicit security policy flag.

## License

Internal use only. Proprietary to the deploying enterprise security framework.
