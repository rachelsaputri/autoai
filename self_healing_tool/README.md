# Self-Healing Error Handler (Fortran)

A modular, high-performance Fortran library for automated error detection, edge-case handling, and system self-healing. 

## Features
- **Error Classification**: Categorized logging (Critical, Warning, Retryable, Silent)
- **Edge Case Simulation**: Robust testing framework for boundary conditions
- **Automated Recovery**: Strategy pattern implementation for self-healing actions
- **State Persistence**: JSON-like state tracking and audit trails
- **Multi-threading Ready**: Thread-safe logging and state management

## Compilation
```bash
gfortran -o self_healing main.f90 error_handler.f90 recovery_engine.f90 config.f90
```

## Usage
1. Initialize the ErrorHandler with configuration
2. Register recovery actions for specific error codes
3. Use the `try_catch` interface to handle execution flow
4. Monitor recovery attempts via the audit trail

## License
MIT
