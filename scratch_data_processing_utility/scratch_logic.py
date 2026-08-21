"""
Equivalent logic to the Scratch Data Processing Utility.
This script simulates what the Scratch blocks would do.
"""
import json
import sys
import os
from datetime import datetime

# Scratch Variables Simulation
DATA_BUFFER = []
RECORD_COUNT = 0
ERROR_COUNT = 0
OUTPUT_LOG = []

def ingest_data(file_path):
    """Simulates the Scratch 'Import CSV' or 'Read from File' blocks."""
    global DATA_BUFFER
    if not os.path.exists(file_path):
        print(f"Error: File {file_path} not found.")
        return False
    
    try:
        with open(file_path, 'r') as f:
            # Scratch reads lines as strings
            lines = f.readlines()
        for line in lines:
            line = line.strip()
            if line:
                DATA_BUFFER.append(line)
        print(f"[Ingestion] Loaded {len(DATA_BUFFER)} records.")
        return True
    except Exception as e:
        print(f"[Ingestion Error] {e}")
        return False

def validate_data(record):
    """Simulates Scratch 'If-Then' validation blocks."""
    global ERROR_COUNT
    # Check if record is empty or malformed
    if not record or len(record) < 5:
        ERROR_COUNT += 1
        OUTPUT_LOG.append(f"Invalid Record: {record}")
        return False
    
    # Scratch-style string check: contains '@' for email validation
    if 'invalid' in record.lower():
        ERROR_COUNT += 1
        OUTPUT_LOG.append(f"Blocked Record: {record}")
        return False
        
    return True

def transform_data(record):
    """Simulates Scratch 'Change String by' and 'Join' blocks."""
    # Trim whitespace
    clean = record.strip()
    # Convert to uppercase (Scratch doesn't have native uppercase, usually done via ASCII or blocks)
    transformed = clean.upper()
    return transformed

def report_output():
    """Simulates Scratch 'Say' or 'Pen' blocks."""
    print("\n--- Processing Report ---")
    print(f"Total Records: {len(DATA_BUFFER)}")
    print(f"Valid Records: {len(DATA_BUFFER) - ERROR_COUNT}")
    print(f"Errors: {ERROR_COUNT}")
    if OUTPUT_LOG:
        print("Errors:")
        for err in OUTPUT_LOG:
            print(f"  - {err}")
    print("----------------------------")

def process_pipeline(input_file):
    """Main loop simulating Scratch 'Repeat' and 'ForEach' blocks."""
    if not ingest_data(input_file):
        return
    
    processed_records = []
    
    # Scratch loop: Repeat (Length of [Data Buffer])
    for i in range(len(DATA_BUFFER)):
        record = DATA_BUFFER[i]
        
        # Scratch block: If <(validate_data) = True> then
        if validate_data(record):
            # Scratch block: Transform and Add to Result List
            cleaned = transform_data(record)
            processed_records.append(cleaned)
            RECORD_COUNT += 1
    
    # Scratch block: Say "Processing Complete"
    print("Processing Complete.")
    report_output()
    return processed_records

if __name__ == "__main__":
    # Create a sample input file for testing
    sample_file = "sample_data.txt"
    with open(sample_file, 'w') as f:
        f.write("User1,Active,Valid\n")
        f.write("User2,Inactive,Valid\n")
        f.write("bad_record\n")
        f.write("User3,Active,invalid_data\n")
    
    print("Running Scratch Data Processing Utility Simulation...")
    process_pipeline(sample_file)
    
    # Cleanup
    os.remove(sample_file)
