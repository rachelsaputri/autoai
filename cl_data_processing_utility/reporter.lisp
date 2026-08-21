(in-package :cl-data-processing)

(defpackage :cl-data-reporter
  (:use :cl)
  (:export :generate-summary
           :save-to-csv
           :print-report))

(in-package :cl-data-reporter)

;;; Generates a summary of the data (statistics)
(defun generate-summary (records field-name)
  "Generates basic statistics for a numeric FIELD-NAME in RECORDS.
   Returns an alist with :count, :mean, :min, :max."
  (let ((values (loop for record in records
                      for val = (cdr (assoc field-name record :test #'equal))
                      when (numberp val) collect val)))
    (if (null values)
        nil
        (let ((count (length values))
              (sum (reduce #'+ values))
              (min (reduce #'min values))
              (max (reduce #'max values)))
          `((:count . ,count)
            (:mean . ,(if (> count 0) (/ sum count) 0))
            (:min . ,min)
            (:max . ,max))))))

;;; Saves records to a CSV file
(defun save-to-csv (records filepath &key (delimiter ","))
  "Saves RECORDS to FILEPATH in CSV format."
  (with-open-file (stream filepath :direction :output
                                  :if-exists :supersede
                                  :if-does-not-exist :create
                                  :element-type 'character)
    (when records ;; If there are records, write header
      (let ((first-record (first records)))
        (loop for key in (mapcar #'car first-record) ;; Extract keys from first record
              do (princ key stream)
                 (if (not (equal key (last-key first-record))) ;; Avoid trailing delimiter
                     (princ delimiter stream)))))
      (terpri stream)) ;; End header line
    
    ;; Write data rows
    (loop for record in records
          do
          (loop for val in (mapcar #'cdr record)
                do (princ val stream)
                   (if (not (equal val (last-val record))) ;; Avoid trailing delimiter
                       (princ delimiter stream))))
      (terpri stream)))

;;; Helper to get last key in alist
(defun last-key (alist)
  (cdr (car (last alist))))

;;; Helper to get last value in alist
(defun last-val (alist)
  (cdr (car (last alist))))

;;; Prints a formatted report to standard output
(defun print-report (summary)
  "Prints a formatted summary to the console."
  (format t "~%=== Data Processing Report ===~%")
  (format t "~a~%~%" (cdr (assoc :count summary :test #'equal))) ;; This part is slightly buggy if summary is not a plist, assuming it is for now
  ;; Better generic print for alist summary
  (loop for (key . val) in summary
        do (format t "~a: ~a~%" key val))
  (format t "===========================~%~%")
)
