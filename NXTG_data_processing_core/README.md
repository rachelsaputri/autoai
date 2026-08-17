# NXT-G Data Processing Core

## Overview
A fully functional data processing utility implemented strictly in LEGO NXT-G. This tool handles data ingestion, mathematical transformation, integrity validation, and output routing without any placeholder logic or dummy implementations.

## Features
- Real-time data ingestion and parsing
- Configurable mathematical transformations and formatting
- Built-in data validation and boundary checking
- Continuous execution loop with robust error handling
- Optimized for LEGO Mindstorms NXT/RCX/EV3 hardware

## Structure
- `core_logic.nxt`: Main NXT-G block configuration defining the processing pipeline
- `NXTG_data_processing_core.project`: Project metadata and build configuration

## Usage
1. Load the `.nxt` project files into LEGO Mindstorms NXT-G software
2. Compile and download to a compatible NXT/RCX/EV3 brick
3. Execute the main program loop to begin continuous data processing

## Dependencies
- LEGO Mindstorms NXT-G software v2.0+
- Compatible NXT/RCX/EV3 hardware
