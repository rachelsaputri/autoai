import csv
import os
from typing import List, Dict, Optional, Union

class CSVProcessor:
    """Handles basic CSV file operations like reading, writing, and filtering."""

    def __init__(self, filepath: str):
        self.filepath = filepath
        if not os.path.exists(filepath):
            raise FileNotFoundError(f"The file {filepath} does not exist.")

    def read_as_list(self) -> List[List[str]]:
        """Reads the CSV file and returns data as a list of lists (excluding header)."""
        data = []
        with open(self.filepath, mode='r', encoding='utf-8') as file:
            reader = csv.reader(file)
            next(reader) # Skip header
            for row in reader:
                data.append(row)
        return data

    def read_as_dicts(self) -> List[Dict[str, str]]:
        """Reads the CSV file and returns data as a list of dictionaries."""
        data = []
        with open(self.filepath, mode='r', encoding='utf-8') as file:
            reader = csv.DictReader(file)
            for row in reader:
                data.append(dict(row))
        return data

    def write_from_dicts(self, data: List[Dict[str, Union[str, int, float]]], output_path: Optional[str] = None):
        """Writes a list of dictionaries to a CSV file."""
        out_path = output_path or self.filepath.replace('.csv', '_processed.csv')
        if not data:
            raise ValueError("Data is empty.")
        
        fieldnames = data[0].keys()
        with open(out_path, mode='w', encoding='utf-8', newline='') as file:
            writer = csv.DictWriter(file, fieldnames=fieldnames)
            writer.writeheader()
            writer.writerows(data)
        return out_path
