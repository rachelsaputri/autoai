# FAUST Data Processing Pipeline

This utility is a data processing pipeline written in FAUST.
It demonstrates the use of functional programming constructs and DSP-like
signal processing patterns adapted for data streams.

## Features

- Data ingestion and normalization
- Functional filtering and mapping
- Aggregation and statistics
- Pipeline composition

## Usage

To run the pipeline:

```bash
faust main.dsp
```

## Architecture

- `main.dsp`: Entry point and pipeline definition
- `types.dsp`: Data type definitions
- `processor.dsp`: Core processing functions
- `utils.dsp`: Helper functions
