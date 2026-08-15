# Cola Network Anomaly Detector

## Overview
The Cola Network Anomaly Detector is a high-performance, real-time network traffic analysis tool built with Cola. It leverages statistical machine learning models to identify deviations from baseline traffic patterns, providing immediate detection of potential security threats.

## Features
- **Real-time Packet Parsing**: Efficiently processes incoming network traffic streams.
- **Statistical Analysis**: Applies rolling window statistics to detect anomalies in packet frequency, size, and protocol usage.
- **Threat Isolation**: Flags high-confidence threats for potential automated isolation.
- **Alert Reporting**: Generates detailed reports on detected anomalies for security orchestration integration.

## Installation
1. Ensure you have a Cola compiler installed.
2. Clone the repository:
   ```bash
   git clone https://github.com/your-org/cola_network_anomaly_detector.git
   ```
3. Navigate to the project directory:
   ```bash
   cd cola_network_anomaly_detector
   ```
4. Build the project:
   ```bash
   cola build
   ```

## Usage
Run the detector with the following command:
```bash
./build/anomaly_detector --capture-interface eth0 --baseline-period 24h
```

### Arguments
- `--capture-interface`: Network interface to capture traffic on.
- `--baseline-period`: Time period to establish baseline traffic patterns.
- `--alert-level`: Minimum confidence level for alerting (0.0 - 1.0).

## Architecture
The tool consists of the following components:
- `packet_capture`: Handles network packet acquisition.
- `anomaly_engine`: Contains the statistical models and detection logic.
- `report_generator`: Formats and outputs alert reports.

## Contributing
Contributions are welcome! Please submit a pull request or open an issue for any feature requests or bug reports.

## License
This project is licensed under the MIT License.
