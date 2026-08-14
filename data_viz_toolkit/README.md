# Data Viz Toolkit

## Overview
A high-performance, memory-safe data visualization engine written in Rust. Designed to handle large datasets efficiently and render interactive plots without blocking the main thread.

## How It Works
1. **Data Ingestion**: Raw data is loaded into memory-safe Rust collections.
2. **Processing Pipeline**: Data is normalized, filtered, and aggregated using parallel iterators.
3. **Rendering Engine**: The plotting module converts processed data into vector graphics or terminal output using optimized rendering algorithms.
4. **Output Generation**: Results are exported to standard formats (SVG, PNG) or displayed in terminal UIs.

## Features
- Zero-cost abstractions for data manipulation
- Thread-safe parallel processing
- Memory-efficient rendering pipeline
- Cross-platform support (Linux, macOS, Windows)

## Usage
See the main source code for implementation details. Run `cargo run` to start.

## Dependencies
- `rayon` for parallelization
- `plotters` for graphics rendering
- `serde` for data serialization
- `csv` and `json` parsers for input handling
