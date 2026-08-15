# ObjectLOGO Compliance Visualization Tool

An interactive diagnostic and visualization tool for compliance auditing, written in ObjectLOGO.

This tool simulates a visual diagnostic interface using ASCII graphics and text-based interaction to audit system compliance based on a set of policies and states.

## Features
- Interactive command-line interface
- ASCII-based visualization of system nodes and connections
- Compliance status reporting
- Simulated diagnostic engine

## Usage

Run the main file with an ObjectLOGO interpreter:

```
logo main.olg
```

## Components

- `main.olg`: Entry point, handles user interaction and orchestration.
- `diagnostic_engine.olg`: Core logic for running diagnostics and checking compliance.
- `visualizer.olg`: Handles ASCII rendering of the system state.
