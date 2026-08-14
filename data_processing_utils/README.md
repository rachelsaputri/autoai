# Data Processing Utilities

This module provides a set of simple, object-oriented tools for handling common data processing tasks involving CSV, JSON, and plain text files.

## Modules

### CSV Processor (`csv_processor.py`)
The `CSVProcessor` class handles reading from and writing to CSV files.

**Key Features:**
- Read CSV data into a list of lists (rows).
- Read CSV data into a list of dictionaries (using the header row as keys).
- Write a list of dictionaries back to a CSV file.

**Usage Example:**
```python
from data_processing_utils.csv_processor import CSVProcessor

# Read data as dictionaries
processor = CSVProcessor('data/sample.csv')
data = processor.read_as_dicts()

# Filter or manipulate data here
filtered_data = [row for row in data if row.get('status') == 'active']

# Write processed data
out_path = processor.write_from_dicts(filtered_data)
```

### JSON Processor (`json_processor.py`)
The `JSONProcessor` class simplifies reading and writing JSON data.

**Key Features:**
- Parse JSON files into Python objects (dicts, lists, etc.).
- Serialize Python objects into formatted JSON files.
- Basic validation to ensure JSON structure compliance.

**Usage Example:**
```python
from data_processing_utils.json_processor import JSONProcessor

# Read JSON
processor = JSONProcessor('data/config.json')
config = processor.read_json()

# Validate structure
is_valid = processor.validate_json(required_keys=['api_key', 'version'])
print(f"Is Valid: {is_valid}")

# Write back
processor.write_json({"status": "updated"}, 'data/output.json')
```

### Text Cleaner (`text_cleaner.py`)
The `TextCleaner` class provides utility methods for cleaning strings or lists of strings.

**Key Features:**
- Remove extra/whitespace characters.
- Remove special characters (keeping alphanumeric and basic punctuation).
- Convert to lowercase.
- Combined cleaning pipeline.

**Usage Example:**
```python
from data_processing_utils.text_cleaner import TextCleaner

text = "  Hello World! 123 #@$  "
cleaner = TextCleaner(text)

# Basic whitespace removal
clean = cleaner.remove_extra_whitespace()
print(clean) # "Hello World! 123 #@$"

# Full clean
full_clean = cleaner.clean(remove_special=True, lowercase=True)
print(full_clean) # "hello world 123"
```n
## Installation

No installation is required. Simply add the `data_processing_utils` folder to your project directory and import the desired classes.

```bash
# Ensure the folder is in your PYTHONPATH or project root
python -c "from data_processing_utils import CSVProcessor, JSONProcessor, TextCleaner; print('Import successful')"n
