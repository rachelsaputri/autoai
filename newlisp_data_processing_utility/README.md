# NewLISP Data Processing Utility

A lightweight, functional data processing utility written in NewLISP. It provides robust functions for parsing, validating, transforming, and exporting data in various formats (CSV, JSON, XML, Text).

## Features

- **Data Parsing**: Load data from CSV, JSON, XML, and raw text files.
- **Validation**: Validate data types, schema structures, and required fields.
- **Transformation**: Map, filter, aggregate, and sort data records.
- **Export**: Save processed data back to CSV, JSON, or XML.
- **Error Handling**: Comprehensive error reporting and logging.

## Usage

```lisp
;; Load the main module
(load "main.nls")

;; Parse a CSV file
(set 'data (parse-csv "./input.csv"))

;; Validate the data
(if (validate-schema data '("id" "name" "email"))
    (println "Data is valid.")
    (println "Data is invalid.")
)

;; Transform: add a new column 'status'
(set 'transformed (map (fn (row)
                        (append row '("active"))
                      )
                      data
                    )
)

;; Export to JSON
(export-json transformed "./output.json")
```

## Requirements

- NewLISP (v10.6+)
- No external dependencies.

## License

MIT
