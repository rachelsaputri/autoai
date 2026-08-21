(in-package :cl-data-processing)

(defpackage :cl-data-processing
  (:use :cl)
  (:export :run-pipeline
           :load-data
           :validate-schema
           :transform-field
           :filter-records
           :generate-summary
           :save-to-csv))

(in-package :cl-data-processing)

;;; Load necessary packages
(include-package :cl-data-ingestor)
(include-package :cl-data-validator)
(include-package :cl-data-transformer)
(include-package :cl-data-reporter)

(defun run-pipeline (input-filepath output-filepath
                     &key (schema nil)
                          (transform-fns nil)
                          (filter-pred nil)
                          (normalize-fields nil))
  "Main orchestration function for the data processing pipeline.
   
   INPUT-FILEPATH: Path to the input data file (csv, json, txt).
   OUTPUT-FILEPATH: Path to save the processed data.
   SCHEMA: Optional plist for validation (e.g., '(:name :string :age :integer)).
   TRANSFORM-FNS: Optional alist of (field-name . function) to transform fields.
   FILTER-PRED: Optional predicate function to filter records.
   NORMALIZE-FIELDS: Optional list of field names to normalize (requires global min/max in transform-fns or defaults)."
  
  (format t "~%Starting Data Processing Pipeline...~%")
  (format t "Input: ~a~%" input-filepath)
  
  ;; 1. Load Data
  (let ((data (load-data input-filepath)))
    (format t "Loaded ~a records.~%" (length data))
    
    ;; 2. Validate Data (if schema provided)
    (if schema
        (let ((valid-data (validate-schema data schema)))
          (unless valid-data
            (format t "Warning: Validation failed, proceeding with potential errors.~%"))
          ;; Optionally filter out invalid records if needed, but here we just warn
          )
        (format t "No schema provided, skipping validation.~%"))
    
    ;; 3. Transform Data
    (when transform-fns
      (loop for (field . transform-fn) in transform-fns
            do (setf data (map-fields data field transform-fn)))
      (format t "Applied transformations.~%"))
    
    ;; 4. Filter Data
    (when filter-pred
      (setf data (filter-records data filter-pred))
      (format t "Applied filtering. Record count: ~a~%" (length data)))
    
    ;; 5. Normalize Data (if specified)
    (when normalize-fields
      (loop for field in normalize-fields
            do 
            (let ((values (loop for r in data
                                for val = (cdr (assoc field r :test #'equal))
                                when (numberp val) collect val)))
              (when values
                (let ((min-val (reduce #'min values))
                      (max-val (reduce #'max values)))
                  (setf data (normalize-data data field min-val max-val))))))
      (format t "Applied normalization.~%"))
    
    ;; 6. Save Output
    (if data
        (progn
          (save-to-csv data output-filepath)
          (format t "Processed data saved to: ~a~%" output-filepath))
        (format t "No data to save.~%"))
    
    ;; 7. Generate Summary
    (when (and data (null normalize-fields)) ;; Example summary for first record's first field if numeric
      (let ((first-rec (first data)))
        (when first-rec
          (let ((first-field (car (car first-rec))))
            (let ((vals (loop for r in data for v = (cdr (assoc first-field r :test #'equal)) when (numberp v) collect v)))
              (when vals
                (let ((summary (generate-summary data first-field)))
                  (print-report summary)))))))))
    
    (format t "Pipeline complete.~%~%")))
