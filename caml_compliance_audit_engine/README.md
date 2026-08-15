# Caml Compliance Audit Engine

A production-grade, fully functional autonomous system compliance audit and remediation tool built strictly in Caml.

## Features

- Deterministic, high-precision workflow for security event correlation
- Robust pattern matching and strict type inference for log parsing
- Immutable data structures ensuring logical soundness
- Functor-based modular architecture for extensibility
- Formal compliance verdicts and machine-readable status updates

## Usage

Compile and run the engine:
```bash
ocamlc -o audit_engine audit_runner.ml policy_enforcer.ml remediation_handler.ml config.ml
./audit_engine
```

## Architecture

- `audit_runner.ml`: Main entry point and workflow orchestration
- `policy_enforcer.ml`: Policy matching and verdict generation
- `remediation_handler.ml`: Automated remediation actions and logging
- `config.ml`: Configuration parsing and validation

## License

MIT
