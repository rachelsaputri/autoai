# Lustre Data Processing Utility

A high-performance, formally verified data processing utility written in Lustre.
Lustre is a synchronous data-flow language used for specifying and generating code for real-time systems.
This utility demonstrates how to implement a data pipeline (Ingest, Transform, Validate, Report) using Lustre's
stream-based reactive programming model.

## Features
- **Data Ingestion**: Reads integer streams representing raw data points.
- **Transformation**: Applies configurable linear transformations (scale and offset).
- **Validation**: Checks for anomalies based on configurable thresholds.
- **Reporting**: Generates summary statistics and anomaly flags.

## How to Run
This project is designed to be compiled using the Lustre compiler (`lsc`).

1. Ensure you have the Lustre compiler installed (`apt-get install lustre` or via OCHRE).
2. Compile the main node:
   ```bash
   lsc -o lustre_dpu lustre_data_processing_utility.dlu
   ```
3. Generate C code for simulation:
   ```bash
   lsc -C lustre_data_processing_utility.dlu
   ```
4. Run the generated C simulation with a test signal.

## Architecture
- `lustre_data_processing_utility.dlu`: The main Lustre definition file containing all nodes.
