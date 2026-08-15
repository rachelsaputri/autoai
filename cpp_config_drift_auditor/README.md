# C++ Configuration Drift Auditor

A high-performance, production-grade configuration drift detection and compliance audit system built strictly in C++.

## Overview

This tool provides deterministic, high-precision monitoring of system configurations against baseline security policies. It leverages C++'s robust type system, RAII principles, and modern concurrency features to detect deviations, generate auditable reports, and maintain a formal compliance registry.

## Features

- **Real-time Drift Detection**: Parses and compares live configurations against defined baselines.
- **Compliance Verification**: Generates formal compliance certificates and machine-readable verdicts.
- **Robust Error Handling**: Comprehensive error management with deterministic rollback capabilities.
- **Modular Architecture**: Separated concerns for parsing, engine logic, and reporting.
- **CMake Build System**: Streamlined compilation and dependency management.

## Directory Structure

```
cpp_config_drift_auditor/
├── CMakeLists.txt
├── README.md
├── src/
│   ├── main.cpp
│   ├── drift_detector.h
│   ├── drift_detector.cpp
│   ├── compliance_engine.h
│   ├── compliance_engine.cpp
│   ├── policy_parser.h
│   ├── policy_parser.cpp
│   ├── drift_registry.h
│   ├── drift_registry.cpp
│   ├── report_generator.h
│   └── report_generator.cpp
└── tests/
    ├── test_drift_detector.cpp
    ├── test_compliance_engine.cpp
    └── test_policy_parser.cpp
```

## Building

Ensure you have CMake 3.10+ and a C++17 compliant compiler installed.

```bash
cd cpp_config_drift_auditor
mkdir build && cd build
cmake ..
make
```

## Usage

After building, run the executable with a configuration baseline path and a target configuration path:

```bash
./cpp_config_drift_auditor --baseline ./configs/baseline.cfg --target ./configs/target.cfg --output ./reports/drift_report.json
```

## Development Standards

- Strict adherence to C++17 standards.
- RAII for resource management.
- Zero dummy code or placeholders; all logic is fully implemented and functional.
- Modular design for seamless integration with formal verification toolchains.

## License

MIT License
