(define (process-data input-file output-file)
  (local (data csv-lines json-output))
  
  ;; Read input file
  (set 'data (read-file input-file))
  
  ;; Process CSV if needed
  (if (ends-with? input-file ".csv")
    (set 'csv-lines (parse-csv data))
    (set 'csv-lines data))
  
  ;; Validate data
  (if (valid-data? csv-lines)
    (begin
      ;; Transform data
      (set 'json-output (transform-to-json csv-lines))
      
      ;; Write output
      (write-to-file output-file json-output)
      (println "Processing complete. Output written to" output-file))
    (println "Data validation failed.")))

(define (read-file filename)
  (if (file-exists? filename)
    (read-lines filename)
    (begin
      (println "Error: File" filename "not found.")
      nil)))

(define (parse-csv data)
  (let ((result (list)))
    (for (line data)
      (push (split line ",") result))
    result))

(define (valid-data? data)
  (if (empty? data)
    (begin
      (println "Error: Data is empty.")
      false)
    true))

(define (transform-to-json data)
  (set 'json-output "[")
  (for (row (length data))
    (set 'json-output (append json-output "{\"row\":" (string row) ",\"data\":" (string row) "}"))
    (if (< row (dec (length data)))
      (set 'json-output (append json-output ","))))
  (append json-output "]"))

(define (write-to-file filename content)
  (file-out filename 1)
  (println content)
  (file-out))

(define (ends-with? str suffix)
  (if (< (length suffix) (length str))
    (if (= suffix (cut str (- (length str) (length suffix)) (length str)))
      true
      false)
    false))

;; Main execution
(when (args)
  (set 'input-file (args 0))
  (set 'output-file (args 1))
  (process-data input-file output-file))
