# JCL Data Processing Utility

## Overview
This utility demonstrates a batch data processing workflow using JCL (Job Control Language), typically executed on IBM mainframe environments. It illustrates how to sort, filter, and format data through a multi-step job stream.

## Features
- **Dataset Creation**: Simulates initial data ingestion.
- **Sorting**: Sorts records by key fields.
- **Filtering**: Removes unwanted records based on criteria.
- **Formatting**: Converts record formats for output.

## Usage
Submit this JCL to your mainframe batch system (e.g., JES2/JES3). Ensure dataset names are appropriate for your environment.

## Components
- **Create Data**: Generates sample input dataset.
- **Sort Step**: Uses SORT utility to order data.
- **Filter Step**: Uses a simple SORT card or COBOL/REXX exec if complex logic is needed (simulated here with SORT).**
- **Report Generation**: Prepares data for spooling or output dataset.

## Notes
- Modify DD statements to point to actual datasets.
- Adjust SORT parameters as per system requirements.
- This is a template/example; actual production JCL may vary.
