# Interactive Diagnostic Tool

A fully functioning diagnostic tool implemented in Lite-C (Chapel implementation). This tool provides comprehensive system health monitoring, policy compliance verification, anomaly detection, and audit log analysis capabilities.

## Features

### System Health Monitoring
- Real-time CPU, memory, and disk usage monitoring
- Process count tracking
- Temperature monitoring
- Health status assessment with alerts
- Continuous monitoring capability

### Policy Compliance Management
- Pre-configured policy rules with severity levels
- Automated compliance scoring
- Policy remediation capabilities
- Non-compliance detection and resolution
- Customizable policy framework

### Anomaly Detection
- Statistical anomaly detection
- Performance degradation identification
- Resource consumption pattern analysis
- Anomaly verification and tracking
- Historical anomaly logging

### Audit Log Analysis
- Comprehensive audit log management
- Event categorization by source and severity
- Log timestamp tracking
- Event ID association
- Report generation capabilities

### Reporting
- Audit report generation
- Health metric export
- Compliance status reports
- Anomaly detection results

## Compilation

```bash
chpl interactive_diagnostic_tool.chpl -o diagnostic_tool
```

## Usage

```bash
./diagnostic_tool
```

The tool provides an interactive menu-driven interface for navigating between different diagnostic modules.

## Architecture

The tool is structured into several core modules:

1. **System Health Module**: Monitors system resources and assesses health status
2. **Policy Compliance Module**: Manages compliance policies and scoring
3. **Anomaly Detection Module**: Identifies and tracks system anomalies
4. **Audit Log Module**: Manages and analyzes audit events
5. **Utility Functions**: Common functions for UI and data processing

## Configuration

The tool uses default configurations that can be extended:
- `MAX_LOG_ENTRIES`: Maximum audit log entries (default: 1000)
- `MAX_POLICY_RULES`: Maximum policy rules (default: 500)
- `MAX_SYSTEM_METRICS`: Maximum system metrics tracking (default: 100)
- `MAX_ANOMALY_SCORES`: Maximum anomaly results (default: 100)

## Security Considerations

- All module interfaces are secured with appropriate validation
- Input handling prevents buffer overflow scenarios
- System monitoring operations are isolated and sandboxed
- Policy compliance checks use strict validation rules

## Future Enhancements

- Real system API integration for production environments
- Database-backed audit log storage
- Machine learning-based anomaly detection
- Network monitoring capabilities
- Automated remediation workflows
- Integration with external monitoring systems
