(in-package :cl-data-processing)

(defpackage :cl-data-validator
  (:use :cl)
  (:export :validate-schema
           :check-type
           :check-consistency
           :report-errors))

(in-package :cl-data-validator)

(defparameter *validation-errors* nil)

(defun report-errors ()
  "Returns the list of validation errors encountered."
  *validation-errors*)

(defun check-type (value expected-type field-name)
  "Checks if VALUE matches EXPECTED-TYPE. Returns T if valid, NIL otherwise."
  (let ((valid t))
    (case expected-type
      ((:string)
       (unless (stringp value)
         (push (format nil "Field '~a' expected STRING, got ~a" field-name (type-of value)) *validation-errors*)
         (setf valid nil)))
      ((:integer)
       (unless (integerp value)
         (push (format nil "Field '~a' expected INTEGER, got ~a" field-name (type-of value)) *validation-errors*)
         (setf valid nil)))
      ((:number)
       (unless (numberp value)
         (push (format nil "Field '~a' expected NUMBER, got ~a" field-name (type-of value)) *validation-errors*)
         (setf valid nil)))
      ((:boolean)
       (unless (booleanp value)
         (push (format nil "Field '~a' expected BOOLEAN, got ~a" field-name (type-of value)) *validation-errors*)
         (setf valid nil)))
      (t (push (format nil "Unknown type constraint: ~a for field ~a" expected-type field-name) *validation-errors*)))
    valid))

(defun validate-schema (records expected-schema)
  "Validates a list of records (alist or plist) against a schema.
   EXPECTED-SCHEMA is a plist: (field-name type ...).
   Returns T if all records pass, NIL otherwise."
  (setf *validation-errors* nil)
  (let ((all-valid t))
    (loop for record in records
          for index from 0
          do
          (loop for (field expected-type) on expected-schema by #'cddr
                do
                (let ((value (cdr (assoc field record :test #'equal)))) ;; Support both Alists and Plists via equal
                  (if (null value)
                      (progn
                        (push (format nil "Record ~a missing required field: ~a" index field) *validation-errors*)
                        (setf all-valid nil))
                      (unless (check-type value expected-type field)
                        (setf all-valid nil))))))
    (if (null *validation-errors*)
        (progn (format t "Validation passed successfully.~%") t)
        (progn (format t "Validation failed with ~a errors.~%" (length *validation-errors*))
               (format t "Errors:~%")
               (dolist (err *validation-errors*) (format t "  - ~a~%" err))
               nil)))
