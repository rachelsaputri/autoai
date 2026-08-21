(in-package :cl-data-processing)

(defpackage :cl-data-ingestor
  (:use :cl)
  (:export :load-data
           :parse-csv
           :parse-json
           :parse-delimited
           :parse-line-by-line))

(in-package :cl-data-ingestor)

;;; Utility to read file content into a string
(defun read-file-to-string (filepath)
  "Reads the entire content of a file at FILEPATH into a string."
  (with-open-file (stream filepath :direction :input
                                   :element-type 'character
                                   :if-does-not-exist :error)
    (let ((content (make-string (file-length stream))))
      (read-sequence content stream)
      content)))

;;; Parses a CSV string into a list of records (list of lists)
(defun parse-csv (data-string &optional (delimiter #\,))
  "Parses a CSV string into a list of records. 
   Each record is a list of strings."
  (let* ((lines (uiop:split-string data-string :separator (string #\newline) :remove-empty-substrings t))
         (header (first lines))
         (data-lines (rest lines))
         (headers (uiop:split-string header :separator (string delimiter) :remove-empty-substrings t))
         (records (loop for line in data-lines
                        collect (uiop:split-string line :separator (string delimiter) :remove-empty-substrings t))))
    (loop for record in records
          when (length= record (length headers)) ;; Basic sanity check
          collect (loop for header in headers
                        for val in record
                        collect (cons header val))))) ;; Return list of association lists (Alists)

;;; Parses a JSON string into a Lisp structure (Alists or Lists)
(defun parse-json (data-string)
  "Parses a JSON string into a Lisp structure.
   Relies on an external JSON parser library (e.g., drakma + s-exml, or cl-json).
   For this utility, we assume a basic recursive descent or external lib integration.
   Since we want pure standard CL without heavy deps, we will simulate the structure 
   if a parser isn't available, or use a simple regex-based extraction for standard key-value pairs.
   
   NOTE: In a production environment, you would use 'cl-json' or 'flexi-streams'.
   Here we provide a robust fallback/standard parser for simple JSON objects."
  ;; Implementation of a simple JSON parser for demonstration of functionality without heavy deps
  ;; This parser handles nested objects, arrays, strings, numbers, booleans, null
  (defparameter *json-pos* 0)
  (defparameter *json-str* "")

  (defun json-parse (json-string)
    (setf *json-str* json-string)
    (setf *json-pos* 0)
    (skip-whitespace)
    (parse-value))

  (defun skip-whitespace ()
    (loop while (and (< *json-pos* (length *json-str*))
                     (find (aref *json-str* *json-pos*) '(#\space #\tab #\newline #\return)))
          do (incf *json-pos*)))

  (defun parse-value ()
    (skip-whitespace)
    (let ((char (if (< *json-pos* (length *json-str*)) (aref *json-str* *json-pos*) nil)))
      (cond ((null char) nil)
            ((char= char #\{) (parse-object))
            ((char= char #\[) (parse-array))
            ((char= char #\" ) (parse-string))
            ((char= char #\t) (parse-true))
            ((char= char #\f) (parse-false))
            ((char= char #\n) (parse-null))
            ((or (digit-char-p char) (char= char #\-)) (parse-number))
            (t (error "Unexpected character in JSON: ~a" char)))))

  (defun parse-object ()
    (incf *json-pos*) ;; skip {
    (skip-whitespace)
    (let ((obj (make-hash-table :test 'equal)))
      (if (char= (aref *json-str* *json-pos*) #\})
          (progn (incf *json-pos*) obj)
          (progn
            (loop do
              (skip-whitespace)
              (let ((key (parse-string)))
                (skip-whitespace)
                (assert (char= (aref *json-str* *json-pos*) #\:))
                (incf *json-pos*)
                (let ((val (parse-value)))
                  (setf (gethash key obj) val)
                  (skip-whitespace)
                  (cond ((char= (aref *json-str* *json-pos*) #\,)
                         (incf *json-pos*))
                        ((char= (aref *json-str* *json-pos*) #\})
                         (incf *json-pos*)
                         (return obj))
                        (t (error "Expected ',' or '}' in JSON object"))))
              while t))))))

  (defun parse-array ()
    (incf *json-pos*) ;; skip [
    (skip-whitespace)
    (if (char= (aref *json-str* *json-pos*) #\])
        (progn (incf *json-pos*) nil)
        (progn
          (let ((arr (list (parse-value))))
            (loop do
              (skip-whitespace)
              (cond ((char= (aref *json-str* *json-pos*) #\,)
                     (incf *json-pos*)
                     (push (parse-value) arr))
                    ((char= (aref *json-str* *json-pos*) #\])
                     (incf *json-pos*)
                     (return (reverse arr)))
                    (t (error "Expected ',' or ']' in JSON array"))))
            (reverse arr))))) ;; Redundant reverse if loop breaks early, but safe

  (defun parse-string ()
    (assert (char= (aref *json-str* *json-pos*) #\"))
    (incf *json-pos*)
    (let ((result ""))
      (loop while (not (char= (aref *json-str* *json-pos*) #\"))
            do
            (let ((char (aref *json-str* *json-pos*)))
              (cond ((char= char #\\)
                     (incf *json-pos*)
                     (let ((escaped (aref *json-str* *json-pos*)))
                       (incf *json-pos*)
                       (cond ((char= escaped #\" ) (setf result (concatenate 'string result #\")))
                             ((char= escaped #\\) (setf result (concatenate 'string result #\\)))
                             ((char= escaped #\n) (setf result (concatenate 'string result #\newline)))
                             ((char= escaped #\t) (setf result (concatenate 'string result #\tab)))
                             (t (setf result (concatenate 'string result escaped)))))
                    (t (setf result (concatenate 'string result char))))
              (incf *json-pos*))
            (when (>= *json-pos* (length *json-str*)) (error "Unterminated string in JSON")))
    (incf *json-pos*) ;; skip closing "
    result))

  (defun parse-true ()
    (assert (string= (subseq *json-str* *json-pos* (+ *json-pos* 4)) "true"))
    (incf *json-pos* 4)
    t)

  (defun parse-false ()
    (assert (string= (subseq *json-str* *json-pos* (+ *json-pos* 5)) "false"))
    (incf *json-pos* 5)
    nil)

  (defun parse-null ()
    (assert (string= (subseq *json-str* *json-pos* (+ *json-pos* 4)) "null"))
    (incf *json-pos* 4)
    nil)

  (defun parse-number ()
    (let ((start *json-pos*))
      (when (char= (aref *json-str* *json-pos*) #\-) (incf *json-pos*))
      (loop while (and (< *json-pos* (length *json-str*))
                       (digit-char-p (aref *json-str* *json-pos*)))
            do (incf *json-pos*))
      (let ((num-str (subseq *json-str* start *json-pos*)))
        (if (find #\e num-str) ;; Scientific notation
            (parse-float num-str)
            (if (find #\. num-str)
                (parse-float num-str)
                (parse-integer num-str))))))

  (defun parse-float (str)
    (with-input-from-string (s str)
      (read s)))

  ;; Return the parsed result from the internal parser
  (json-parse data-string))

;;; Generic Delimited Parser
(defun parse-delimited (data-string &key (delimiter #\,) (has-header t))
  "Parses a generic delimited string."
  (let* ((lines (uiop:split-string data-string :separator (string #\newline) :remove-empty-substrings t))
         (data-lines (if has-header (rest lines) lines))
         (records (loop for line in data-lines
                        collect (uiop:split-string line :separator (string delimiter) :remove-empty-substrings t))))
    (if has-header
        (let ((headers (uiop:split-string (first lines) :separator (string delimiter) :remove-empty-substrings t)))
          (loop for record in records
                collect (loop for header in headers
                              for val in record
                              collect (cons header val))))
        records))) ;; Return list of lists if no header

;;; Main Load Function
(defun load-data (filepath)
  "Loads data from a file based on extension."
  (let ((content (read-file-to-string filepath))
        (ext (string-downcase (pathname-type (pathname filepath)))))
    (cond ((string= ext "csv")
           (parse-csv content))
          ((string= ext "json")
           (parse-json content))
          ((string= ext "txt")
           (parse-delimited content :delimiter #\, :has-header t))
          (t (error "Unsupported file type: ~a" ext)))))
