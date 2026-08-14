# Interactive Diagnostic & Visualization Tool

## Overview
This tool provides an interactive graphical interface to monitor and visualize simulated diagnostic data. It is built using Python and Tkinter.

## Features
- **Real-time Visualization**: Displays two simulated metrics in real-time using a canvas widget.
- **Interactive Controls**: Start, stop, and reset diagnostic data generation.
- **Anomaly Detection**: Basic visual indication of anomalies when thresholds are exceeded.
- **Responsive UI**: The graph resizes with the window.

## Prerequisites
- Python 3.x
- Tkinter (usually included with standard Python installations)

## Installation
1. Clone the repository or download the script.
2. Navigate to the `interactive_diagnostic_tool` directory.

## Usage
Run the main script:
```bash
python main.py
```

## How it Works
- The tool simulates two metrics (Metric 1 and Metric 2) with Gaussian distributions.
- Data points are added to a rolling window of the last 100 points.
- The GUI updates the plot every 0.5 seconds.
- Metric 1 is plotted in blue, and Metric 2 is plotted in red.
- If Metric 1 exceeds 130, a status bar alert is displayed.

## Customization
You can modify the `diagnostics_loop` method in `main.py` to change the simulated data generation logic or add more metrics.

## License
MIT License
