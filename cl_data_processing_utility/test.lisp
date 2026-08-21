(in-package :cl-data-processing)

(defpackage :cl-test
  (:use :cl)
  (:import-from :cl-data-processing
                :run-pipeline
                :load-data
                :validate-schema
                :transform-field
                :generate-summary
                :save-to-csv))

(in-package :cl-test)

(defun run-tests ()
  (format t "~%=== Running CL Data Processing Tests ===~%~%")
  
  ;; Create a test CSV file
  (with-open-file (s "test_data.csv" :direction :output :if-exists :supersede)
    (format s "id,name,age,salary~%")
    (format s "1,Alice,30,50000~%")
    (format s "2,Bob,25,60000~%")
    (format s "3,Charlie,35,70000~%")
    (format s "4,Diana,28,55000~%")
    (format s "5,Eve,32,65000~%"))
  
  ;; Test 1: Load Data
  (format t "Test 1: Loading Data...~%")
  (let ((data (load-data "test_data.csv")))
    (assert (= (length data) 5) () "Should load 5 records.")
    (format t "  PASS: Loaded ~a records.~%" (length data)))
  
  ;; Test 2: Validate Schema
  (format t "Test 2: Validating Schema...~%")
  (let ((valid (validate-schema data '(id :integer name :string age :integer salary :number))))
    (assert valid () "Schema validation should pass.")
    (format t "  PASS: Schema valid.~%"))
  
  ;; Test 3: Transform Field
  (format t "Test 3: Transforming Field (Salary + 10%)...~%")
  (let ((transformed (map-fields data 'salary #'(lambda (x) (* x 1.1)))))
    (assert (= (length transformed) 5) () "Record count should remain 5.")
    (let ((first-salary (cdr (assoc 'salary (first transformed) :test #'equal))))
      (assert (= first-salary 55000) () "First salary should be 55000."))
    (format t "  PASS: Salary transformed.~%"))
  
  ;; Test 4: Filter Records
  (format t "Test 4: Filtering Records (Age > 30)...~%")
  (let ((filtered (filter-records data #'(lambda (r) (> (cdr (assoc 'age r :test #'equal)) 30)))))
    (assert (= (length filtered) 2) () "Should have 2 records (Charlie, Eve).")
    (format t "  PASS: Filtered to ~a records.~%" (length filtered)))
  
  ;; Test 5: Generate Summary
  (format t "Test 5: Generating Summary (Age)...~%")
  (let ((summary (generate-summary data 'age)))
    (assert summary () "Summary should not be nil.")
    (let ((count (cdr (assoc ':count summary :test #'equal))))
      (assert (= count 5) () "Count should be 5."))
    (format t "  PASS: Summary generated.~%"))
  
  ;; Test 6: Save to CSV
  (format t "Test 6: Saving to CSV...~%")
  (save-to-csv data "output_data.csv")
  (assert (probe-file "output_data.csv") () "Output file should exist.")
  (format t "  PASS: Output saved.~%~%")
  
  (format t "=== All Tests Passed! ===~%~%")
  
  ;; Cleanup
  (delete-file-if-exists "test_data.csv")
  (delete-file-if-exists "output_data.csv"))

(defun delete-file-if-exists (filename)
  (when (probe-file filename)
    (delete-file filename)))
