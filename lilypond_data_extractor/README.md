# LilyPond Data Extraction & Parsing Utility

## Overview
This project implements a complex data extraction and parsing utility using **LilyPond**, a music notation software. While typically used for sheet music, LilyPond is a fully Turing-complete language with robust parsing capabilities. This project demonstrates how LilyPond can be leveraged to parse structured data, extract complex metrics, and format outputs as musical scores for human-readable inspection.

## Features
- **Data Ingestion**: Reads custom delimited data files.
- **Parsing Engine**: Breaks down records into structured components.
- **Extraction Engine**: Calculates metrics and aggregates data.
- **Visualization**: Outputs data as musical notation for visual correlation.

## Usage
1. Create a `data.csv` file with your structured data.
2. Run the LilyPond compiler: `lilypond main.ly`
3. View the generated `main.pdf`.
