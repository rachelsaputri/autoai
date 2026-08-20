#lang racket

;; ingestor.rkt - Data ingestion module

(provide ingest-data)

(require "utils.rkt")

;; Ingest data based on format
(define (ingest-data file-path format)
  (cond
    [(equal? format "csv") (ingest-csv file-path)]
    [(equal? format "json") (ingest-json file-path)]
    [(equal? format "txt") (ingest-txt file-path)]
    [else (error (format "Unsupported format: ~a" format))]))

;; Ingest CSV data
(define (ingest-csv file-path)
  (define csv-string (file->string file-path))
  (define csv-lines (string-split csv-string "\n"))
  
  (when (empty? csv-lines)
    (error "CSV file is empty"))
  
  (define header (string-split (first csv-lines) ","))
  (define data-rows (rest csv-lines))
  
  ;; Filter out empty lines
  (define valid-rows (filter (lambda (line) (not (string=? line ""))) data-rows))
  
  (define records (map (lambda (row)
                         (define values (string-split row ","))
                         (if (= (length values) (length header))
                             (list->hash (map list header values))
                             (error (format "Row length mismatch: expected ~a, got ~a" (length header) (length values)))))
                       valid-rows))
  
  records)

;; Ingest JSON data
(define (ingest-json file-path)
  (define json-string (file->string file-path))
  (define json-data (json-string->bytes json-string)) ;; Assume json-string->bytes is defined in utils or use built-in
  ;; Note: Racket's built-in `json` library might be needed. Using a simple parser for demonstration if not available.
  ;; For production, (require json) and use `read-json`.
  (require json)
  (define parsed (call-with-input-string json-string read-json))
  
  (cond
    [(list? parsed)
     ;; List of objects or values
     (if (and (list? (first parsed)) (hash? (first parsed)))
         parsed ;; Assume it's a list of records
         (map (lambda (item) (hash "value" item)) parsed)) ;; Wrap single values
     ]
    [(hash? parsed)
     ;; Single object
     (list parsed)]
    [else (error "Unsupported JSON structure")]))

;; Ingest TXT data
(define (ingest-txt file-path)
  (define lines (file->lines file-path))
  (map (lambda (line) (hash "line" line)) lines))
