# Adaptive Security Dashboard

A real-time graphical interface built with Genie for visualizing configuration drift, correlating security alerts, and managing policy enforcement actions.

## Features

- Real-time visualization of configuration drift from `adaptive_drift_monitor`
- Correlation of security alerts from various sources
- Policy enforcement action management
- GTK+ based graphical user interface
- Robust event handling using Genie's GObject integration

## Prerequisites

- Genie compiler
- GTK+ 3.x development libraries
- Required Genie packages: `gio-2.0`, `gtk+-3.0`

## Build Instructions

1. Install prerequisites
2. Compile the main application:
   ```bash
   genie main.gs
   gcc -o adaptive_security_dashboard main.c $(pkg-config --cflags --libs gtk+-3.0 gio-2.0)
   ```

## Usage

Run the compiled binary to start the dashboard:

```bash
./adaptive_security_dashboard
```

## Architecture

- `main.gs`: Entry point and UI initialization
- `drift_visualizer.gs`: Handles configuration drift data visualization
- `alert_correlator.gs`: Processes and correlates security alerts
- `policy_manager.gs`: Manages policy enforcement actions

## Data Ingestion

The dashboard expects JSON-formatted data from upstream systems.

## Visualization Output

- Graphs and charts for drift trends
- Alert correlation matrices
- Policy enforcement status indicators

## Security Considerations

- All external data is validated before processing
- Secure communication channels for data ingestion
- Role-based access control for policy management

## License

MIT License
