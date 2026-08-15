# Scheme Compliance Rule Engine

## Overview
A production-grade, fully functional declarative compliance rule generator and validator built strictly in Scheme. This tool implements AST-based rule parsing, semantic validation against regulatory frameworks, automated constraint generation, and machine-readable report output.

## Features
- **AST-Based Parsing**: Parses human-readable compliance rules into abstract syntax trees.
- **Semantic Validation**: Checks rules against predefined regulatory frameworks (e.g., GDPR, HIPAA, SOX).
- **Constraint Generation**: Automatically derives constraints from parsed rules.
- **Report Output**: Generates detailed, machine-readable reports (JSON format) on compliance status.

## Architecture
- **main.scm**: Entry point and orchestration logic.
- **parser.scm**: AST construction and rule parsing.
- **validator.scm**: Semantic validation and constraint checking.
- **generator.scm**: Constraint generation and report formatting.

## Usage
1. Place your compliance rules in a `.scm` file.
2. Run the engine: `scheme main.scm`
3. Review the generated report in `report.json`.

## Example Rule
```scheme
(rule "data-encryption")
  (requires (encryption "AES-256"))
  (applies-to (scope "all-data-at-rest"))
```
