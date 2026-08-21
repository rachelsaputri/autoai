(in-package :cl-data-processing)

(defpackage :cl-data-transformer
  (:use :cl)
  (:export :transform-field
           :map-fields
           :filter-records
           :normalize-data
           :remove-nulls))

(in-package :cl-data-transformer)

;;; Applies a function to a specific field in a record (alist or plist)
(defun transform-field (record field-name transform-fn)
  "Applies TRANSFORM-FN to the value associated with FIELD-NAME in RECORD.
   Returns a new record with the transformed value."
  (let ((value (cdr (assoc field-name record :test #'equal))))
    (if value
        (let ((new-value (funcall transform-fn value)))
          ;; Handle both alist and plist updates
          (if (and (consp record) (keywordp (car record))) ;; Likely a plist
              (acons field-name new-value (remove field-name record :test #'equal))
              (acons field-name new-value (remove field-name record :test #'equal)))) ;; Fallback to alist logic
        record)))

;;; Maps a transformation function over a list of records for a specific field
(defun map-fields (records field-name transform-fn)
  "Maps TRANSFORM-FN to FIELD-NAME for all RECORDS in RECORDS."
  (loop for record in records
        collect (transform-field record field-name transform-fn)))

;;; Filters records based on a predicate function
(defun filter-records (records predicate)
  "Returns records from RECORDS that satisfy PREDICATE."
  (remove-if-not predicate records))

;;; Normalizes numeric fields (min-max normalization)
(defun normalize-data (records field-name min-val max-val)
  "Normalizes FIELD-NAME in RECORDS using min-max normalization.
   MIN-VAL and MAX-VAL should be the global min and max for the field."
  (map-fields records field-name
              (lambda (val)
                (if (= max-val min-val) 0.0 ;; Avoid division by zero
                    (/ (- val min-val) (- max-val min-val))))))

;;; Removes records with null/nil values in specific fields
(defun remove-nulls (records &key (fields '()))
  "Removes records from RECORDS where any of FIELDS have a null/nil value."
  (remove-if (lambda (record)
               (loop for field in fields
                     thereis (null (cdr (assoc field record :test #'equal)))))
             records))
