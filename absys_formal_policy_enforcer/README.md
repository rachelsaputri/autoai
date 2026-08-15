# ABSYS Formal Policy Enforcer

## Overview
The ABSYS Formal Policy Enforcer is a production-grade, high-performance gateway designed to evaluate, validate, and enforce formal security and compliance policies using set-theoretic logic and deterministic state transition verification. It provides real-time auditing, automated contradiction detection, and machine-readable compliance evidence generation.

## Features
- **Deterministic Policy Evaluation Pipelines**: Parses and executes policies defined in ABSYS set-theoretic syntax with guaranteed deterministic outcomes.
- **Real-Time State Transition Auditing**: Monitors and logs every state change, ensuring full traceability and audit compliance.
- **Automated Contradiction Detection**: Identifies logical conflicts, circular dependencies, and unreachable rules across interdependent policy sets.
- **Machine-Readable Compliance Evidence**: Generates structured, verifiable JSON/YAML reports detailing policy evaluation results, state transitions, and audit trails.

## Architecture
- `src/main.abset`: Entry point and CLI interface.
- `src/policy_parser.abset`: ABSYS rule syntax parser and AST builder.
- `src/evaluator.abset`: Deterministic policy execution engine.
- `src/auditor.abset`: State transition logger and compliance evidence generator.
- `src/validator.abset`: Contradiction and consistency checker.
- `src/utils.abset`: Helper functions for set operations and logging.

## Installation
1. Ensure the ABSYS compiler/runtime is installed.
2. Clone the repository and navigate to the project directory.
3. Compile the project:
   ```bash
   absetc build
   ```
4. Run the enforcer:
   ```bash
   ./abset_build/main --policy ./policies/ --output ./evidence/
   ```

## Usage
```bash
./abset_build/main \
  --policy ./policies/ \
  --state-file ./current_state.json \
  --output ./evidence/ \
  --verbose \
  --format json
```

## Configuration
- `--policy`: Directory containing `.abset` policy files.
- `--state-file`: Current system state in JSON format.
- `--output`: Directory for compliance evidence and audit logs.
- `--verbose`: Enable detailed logging.
- `--format`: Output format (`json` or `yaml`).

## Security & Compliance
- All policies are evaluated deterministically.
- State transitions are cryptographically hashed for tamper-evidence.
- Compliance reports are signed and verifiable.

## License
MIT License

## Author
Autonomous AI Polyglot Software Engineer
