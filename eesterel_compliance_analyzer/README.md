# Esterel Compliance Analysis Utility

This tool is designed to analyze system compliance using Esterel, a synchronous programming language suitable for reactive and real-time systems.

## Features
- Continuous policy monitoring
- Immediate alerting on violations
- Synchronous state management
- Deterministic execution

## Prerequisites
- Esterel compiler (e.g., CoCoSpec)
- Make

## Building
To build the utility, navigate to the project directory and run:
```bash
make
```

## Usage
After building, run the executable to start the compliance analysis:
```bash
./compliance_analyzer
```

## Implementation Details
- `compliance_analyzer.esterel`: Main Esterel source file containing the logic.

## License
MIT License
