# LabVIEW Industrial Monitor

## Overview
`labview_industrial_monitor` is a real-time data acquisition and control dashboard built STRICTLY using LabVIEW. It visualizes live sensor feeds, automates feedback control loops, and manages industrial IoT workflows with native DAQ hardware integration.

## Architecture
- **Front Panel:** Interactive virtual instrument with customizable gauges, indicators, and control widgets.
- **Block Diagram:** Modular graphical programming structure featuring state machines for event handling, sequence structures for timed data acquisition, and parallel loops for concurrent sensor polling and alarm processing.
- **DAQ Integration:** Direct communication with NI-DAQmx devices for real-time signal acquisition.
- **Data Logging:** CSV and TDMS file output for historical trend analysis and audit compliance.

## Folder Structure
```
labview_industrial_monitor/
├── labview_industrial_monitor.vi          # Main application entry point
├── SubVIs/
│   ├── DAQ_SensorAcquisition.vi           # Handles raw sensor data polling
│   ├── Signal_Filtering.vi                # Noise reduction and signal conditioning
│   ├── Feedback_Controller.vi             # PID loop automation logic
│   ├── Alarm_Scoring.vi                   # Threshold evaluation and alert dispatch
│   └── Data_Logger.vi                     # CSV/TDMS write operations
├── resources/
│   ├── palettes.lvlib                     # Custom indicator/control palettes
│   └── images/                            # UI assets and branding
├── README.md
└── labview_industrial_monitor.lvproj      # Main project file
```

## Configuration Standards
1. **Timing & Execution:** Utilize LabVIEW's event structure for non-blocking UI updates. Implement priority-based task scheduling to prevent DAQ buffer overflows.
2. **Error Handling:** Wrap all I/O operations in robust error clusters. Implement visual error indicators on the front panel and structured error handling in the block diagram.
3. **Scalability:** Design SubVIs with loose coupling. Use global data structures (clusters or.lvclass) for inter-loop communication to facilitate multi-sensor expansion.

## Deployment Workflow
1. Open `labview_industrial_monitor.lvproj` in the LabVIEW development environment.
2. Configure DAQmx channels in the `DAQ_SensorAcquisition.vi` to match your physical hardware wiring.
3. Set threshold parameters in the `Alarm_Scoring.vi` cluster to define normal operating ranges.
4. Compile and deploy to the target runtime or standalone executable for unattended monitoring.

## Prerequisites
- LabVIEW 2022 or newer
- NI-DAQmx Driver (for hardware integration)
- (Optional) Real-Time Module for embedded controller deployment
