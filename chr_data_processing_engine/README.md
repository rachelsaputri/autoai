# CHR Data Processing Engine

## Overview
This utility is a data processing engine written in **Constraint Handling Rules (CHR)**. It leverages the declarative nature of CHR to define constraints for data validation, transformation, and normalization. The engine operates by processing a stream of data constraints through a rule-based system.

## Features
- **Constraint-Based Validation**: Validates data against defined integrity constraints.
- **Transformation Rules**: Applies transformations based on constraint satisfaction.
- **Normalization**: Reduces data constraints to a normal form.

## Prerequisites
- A Prolog environment with CHR support (e.g., SWI-Prolog).

## Usage
Load the engine into your Prolog interpreter:
```prolog
['engine.chr'].
```

Execute the processing pipeline:
```prolog
process_data(DataStream).
```
