# VHDL Text Formatting & Cleaning Pipeline

## Overview
This tool implements a hardware-accelerated text formatting and dataset cleaning pipeline using VHDL. Designed for high-throughput, deterministic data processing, it is suitable for FPGA-based log preprocessing, telemetry normalization, or embedded security audit data cleaning.

## Features
- **ASCII Validation & Sanitization**: Filters non-printable ASCII characters.
- **Whitespace Normalization**: Collapses multiple spaces/tabs into single spaces and removes leading/trailing whitespace.
- **Case Normalization**: Converts all uppercase characters to lowercase (or vice versa).
- **Tokenization**: Extracts words separated by delimiters.
- **Deterministic Clock-Driven Processing**: Processes one character per clock cycle for predictable latency.

## Architecture
1. **Input Interface**: `clk`, `rst_n`, `data_in`, `data_valid`
2. **State Machine**: Manages reading, cleaning, and buffering stages.
3. **Cleaner Unit**: Applies regex-like rules via finite state transitions.
4. **Output Interface**: `cleaned_data_out`, `cleaned_valid`, `end_of_block`

## Usage
- Configure `TEXT_WIDTH` for parallel processing width.
- Provide a clock signal and reset.
- Feed in ASCII data via `data_in` and assert `data_valid`.
- Read cleaned data from `cleaned_data_out` when `cleaned_valid` is asserted.

## License
MIT
