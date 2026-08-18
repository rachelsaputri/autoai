# Elixir Data Processing Utility

A high-performance, functional data processing utility written in Elixir.
It leverages the power of the BEAM VM, pattern matching, and immutability
to provide a robust pipeline for ingesting, transforming, and validating data.

## Features

- **Modular Architecture**: Separate modules for ingestion, transformation, validation, and reporting.
- **Fault Tolerance**: Built on OTP principles for resilient error handling.
- **Pattern Matching**: Utilizes Elixir's powerful pattern matching for clean data processing logic.
- **JSON Support**: Native JSON encoding/decoding for easy integration with web services.
- **Extensible**: Easy to add new transformers and validators.

## Project Structure

```
elixir_data_processing_utility/
├── lib/
│   ├── data_processing_engine.ex    # Main orchestration module
│   ├── ingestor.ex                  # Data ingestion logic
│   ├── transformer.ex               # Data transformation logic
│   ├── validator.ex                 # Data validation logic
│   └── reporter.ex                  # Reporting logic
├── mix.exs                          # Mix project configuration
├── README.md
└── .gitkeep
```

## Prerequisites

- [Elixir](https://elixir-lang.org/) (v1.14+)
- [Erlang/OTP](https://www.erlang.org/) (v25+)

## Installation

1. Clone the repository or copy the files to your local machine.
2. Navigate to the project directory:
   ```bash
   cd elixir_data_processing_utility
   ```
3. Fetch dependencies:
   ```bash
   mix deps.get
   ```
4. Compile the project:
   ```bash
   mix compile
   ```

## Usage

### Interactive Shell

You can use the utility in `iex`:

```elixir
iex -S mix

# Load sample data
sample_data = [
  %{"id" => 1, "name" => "Alice", "age" => 30, "email" => "alice@example.com"},
  %{"id" => 2, "name" => "Bob", "age" => "invalid", "email" => "bob@example.com"},
  %{"id" => 3, "name" => "Charlie", "age" => 35, "email" => "charlie@example.com"}
]

# Process the data
result = DataProcessingEngine.process(sample_data)
IO.inspect(result)
```

### Programmatic Usage

```elixir
# Define input data
data = [%{"id" => 1, "name" => "John", "age" => 25}]

# Run the pipeline
processed = DataProcessingEngine.process(data)

# Access results
processed.valid_records
processed.invalid_records
processed.summary
```

## Configuration

The utility uses default configurations but can be extended by modifying the
`lib/validator.ex` and `lib/transformer.ex` modules to suit specific data schemas
and business rules.

## License

MIT
