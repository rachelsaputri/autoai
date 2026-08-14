# Self-Healing Tool

## Overview
The Self-Healing Tool is designed to handle edge cases and errors in real-time by analyzing system states, detecting anomalies, and automatically applying recovery strategies.

## Features
- **Error Detection**: Monitors system inputs and outputs to identify deviations.
- **Recovery Strategies**: Applies predefined rules to restore normal operation.
- **Edge Case Handling**: Specialized logic for handling unusual or boundary conditions.
- **Configurable**: Easily customizable recovery rules via the configuration file.

## File Structure
- `main.rex`: Entry point of the tool.
- `recovery_engine.rex`: Core logic for recovery strategies.
- `error_handler.rex`: Utility functions for error parsing and handling.
- `config.rex`: Configuration settings for the tool.

## Usage
1. Ensure REX is installed on your system.
2. Run `main.rex` to start the self-healing process.
3. Configure recovery rules in `config.rex` as needed.

## Example
```
main.rex -c config.rex -d /var/log/system.log
```

## License
MIT License
