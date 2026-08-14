# Dataset Cleaner

This folder contains automated AI helper scripts designed for dataset cleaning.

## Features
- **Automated Cleaning**: Automatically reads CSV files and performs standard cleaning tasks.
- **Duplicate Removal**: Detects and removes duplicate rows.
- **Missing Value Handling**: Handles missing data by filling numeric columns with medians and dropping/emptying string columns.
- **Logging**: Uses Python's logging module for clear execution feedback.

## Usage

### Prerequisites
Ensure you have Python 3.6+ installed. Install required packages:

```bash
pip install pandas
```

### Running the Script

1. Navigate to the `dataset_cleaner` directory.
2. Run the script with the path to your CSV file:

```bash
python cleaner.py path/to/your/dataset.csv
```

3. The cleaned file will be saved as `dataset_cleaned.csv` in the same directory.

### Programmatic Usage

You can also import the function into your own scripts:

```python
from dataset_cleaner import clean_dataset

clean_dataset('data.csv', 'output.csv')
```

## Notes
- This tool is intended for basic cleaning tasks. Complex cleaning requirements may need custom logic.
- Always backup your original data before running automated cleaning scripts.
