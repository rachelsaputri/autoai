# Signal Processing Pipeline

## Overview
The `signal_processing_pipeline` is a high-performance numerical analysis engine designed to process network telemetry data streams. Built strictly in Yorick, it leverages Yorick's optimized matrix operations and array manipulation capabilities to perform real-time spectral analysis, Fourier transforms, and noise filtering. This pipeline serves as a pre-processor for the `anomaly_detector`, enhancing signal clarity and detection sensitivity.

## Features
- **Fast Fourier Transform (FFT):** Converts time-domain signals into frequency-domain representations to identify periodic patterns.
- **Spectral Analysis:** Computes power spectral density to detect dominant frequencies in telemetry data.
- **Noise Filtering:** Implements low-pass, high-pass, and band-pass filters to isolate relevant signal components.
- **Matrix Operations:** Utilizes Yorick's native array handling for efficient linear algebra computations.
- **Modular Design:** Components are organized into reusable Yorick scripts for easy integration and extension.

## Directory Structure
```
signal_processing_pipeline/
├── README.md
├── fft_analysis.y
├── spectral_filter.y
├── noise_reducer.y
├── main_pipeline.y
└── utils.y
```

## Installation
No external dependencies are required beyond a standard Yorick installation. Ensure your Yorick environment supports the matrix operations used in the scripts.

## Usage
To run the pipeline:
```bash
yorick main_pipeline.y
```

To run individual components:
```bash
yorick fft_analysis.y
yorick spectral_filter.y
yorick noise_reducer.y
```

## Input Data Format
The pipeline expects input data in CSV or plain text format, with numerical values representing signal amplitudes over time. Each column represents a different signal channel.

## Output
Processed signals are exported to CSV files with the same structure as the input, but with enhanced signal-to-noise ratios and extracted spectral features.

## Integration
The output of this pipeline can be directly consumed by the `anomaly_detector` for further analysis. Ensure that the output format matches the expected input schema of the downstream tools.

## License
This project is licensed under the MIT License. See the LICENSE file for details.
