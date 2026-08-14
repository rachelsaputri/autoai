# Config Validator Tool

A CLI utility to validate configuration files for the existing Rust-based services in the workspace.

## Features

- Validates TOML and JSON configuration files against predefined schemas.
- Checks for missing required fields and type mismatches.
- Provides detailed error messages and exit codes.
- Supports logging for debugging purposes.

## Supported Config Formats

- TOML
- JSON

## Validation Rules

- Required fields must be present.
- Field types must match expected types (e.g., string, integer, boolean).
- Enum values must be within allowed ranges.
- Date fields must be in `YYYY-MM-DD` format.

## Exit Code Semantics

- `0`: Validation successful.
- `1`: Validation failed with errors.
- `2`: Usage error (incorrect arguments).
- `3`: Internal error (unexpected panic or runtime failure).

## Usage

```bash
cargo run -- --config-file path/to/config.toml --format toml
```

## License

MIT
