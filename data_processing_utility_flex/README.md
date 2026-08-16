# Data Processing Utility (Flex)

A robust, production-ready data processing utility written in Flex (Lexical Analyzer Generator). This tool parses, tokenizes, and processes structured text data streams with high efficiency.

## Features

- **High-Performance Parsing**: Leverages Flex's optimized lexical analysis engine.
- **Structured Data Handling**: Supports CSV, JSON-like, and custom delimited formats.
- **Modular Rules**: Extensible rule set for token classification and data extraction.
- **C Integration**: Outputs C code that integrates seamlessly with standard data processing pipelines.

## Usage

### Prerequisites

- Flex (Lexical Analyzer Generator)
- Bison (Parser Generator, optional for advanced parsing)
- GCC or compatible C compiler

### Building

1. Generate the lexer:
   ```bash
   flex data_processor.l
   ```

2. Compile the generated C code:
   ```bash
   gcc -o data_processor lex.yy.c -lfl
   ```

### Running

```bash
./data_processor < input_data.txt
```

## Supported Input Formats

- CSV (Comma-Separated Values)
- Pipe-Delimited
- Tab-Separated
- Custom Delimiters (configurable)

## File Structure

- `data_processor.l`: Main Flex specification file containing all lexical rules and C code generation logic.

## License

MIT License
