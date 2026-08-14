# Threat 3D Visualizer

## Overview
This module provides a MaxScript-based solution for transforming multi-vector security telemetry into immersive 3D spatial representations. It is designed to follow the output of the correlation engine, enabling intuitive analysis of complex attack chains through volumetric rendering and dynamic topology mapping.

## Prerequisites
- Autodesk 3ds Max with MaxScript engine enabled
- Integration with the existing correlation engine data exports (JSON/CSV formats)

## Architecture & Workflow
1. **Data Ingestion**: Parses correlated threat data exported from the parent project's correlation engine.
2. **Spatial Mapping**: Translates network nodes, attack vectors, and severity metrics into 3D coordinates and visual properties (scale, color, emissive intensity).
3. **Scene Generation**: Automatically constructs the 3D scene hierarchy, applying procedural geometry and material assignments based on threat severity.
4. **Rendering Pipeline**: Configures lighting and camera systems for immersive monitoring dashboards.

## MaxScript Integration
- All core logic is implemented STRICTLY using MaxScript (`.ms` files).
- The script handles automated scene building, data serialization parsing, and dynamic animation loops for real-time threat progression visualization.

## Usage
1. Export threat correlation data from the parent engine.
2. Launch 3ds Max and open the `generate_treptography.ms` script.
3. Run the script to import the dataset and generate the 3D scene.
4. Utilize the built-in camera controllers and lighting presets for immersive monitoring.

## Limitations & Considerations
- Performance optimization is required for datasets exceeding 10,000 correlated events.
- Depends on standard 3ds Max rendering backends (Scanline, Arnold, or V-Ray if installed).
- Ensure strict adherence to MaxScript sandboxing rules when handling external file I/O.

## Development Guidelines
- Maintain modular script functions for easy extension.
- Document all data transformation pipelines thoroughly.
- Prioritize memory management when iterating over large telemetry arrays.
