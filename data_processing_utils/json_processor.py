import json
import os
from typing import List, Dict, Any, Optional

class JSONProcessor:
    """Handles JSON file operations like parsing and validation."""

    def __init__(self, filepath: str):
        self.filepath = filepath
        if not os.path.exists(filepath):
            raise FileNotFoundError(f"The file {filepath} does not exist.")

    def read_json(self) -> Any:
        """Reads and parses a JSON file."""
        with open(self.filepath, mode='r', encoding='utf-8') as file:
            return json.load(file)

    def write_json(self, data: Any, output_path: Optional[str] = None):
        """Writes data to a JSON file."""
        out_path = output_path or self.filepath.replace('.json', '_processed.json')
        with open(out_path, mode='w', encoding='utf-8') as file:
            json.dump(data, file, indent=4, default=str)
        return out_path

    def validate_json(self, required_keys: Optional[List[str]] = None) -> bool:
        """Basic validation: checks if file is valid JSON and optionally checks for specific keys."""
        try:
            data = self.read_json()
            if required_keys:
                if isinstance(data, dict):
                    for key in required_keys:
                        if key not in data:
                            return False
                else:
                    # If data is list or other type, check if items contain keys if they are dicts
                    if isinstance(data, list):
                        for item in data:
                            if isinstance(item, dict):
                                for key in required_keys:
                                    if key not in item:
                                        return False
            return True
        except (json.JSONDecodeError, ValueError):
            return False
