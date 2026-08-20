#lang racket

;; reporter.rkt - Data reporting and export module

(provide export-data generate-report)

(require "utils.rkt")

;; Export data to file
(define (export-data data file-path format)
  (cond
    [(equal? format "csv") (export-csv data file-path)]
    [(equal? format "json") (export-json data file-path)]
    [(equal? format "txt") (export-txt data file-path)]
    [else (error (format "Unsupported export format: ~a" format))]))

;; Export to CSV
(define (export-csv data file-path)
  (when (empty? data)
    (error "No data to export"))
  
  (define header (hash-keys (first data)))
  (define csv-string (build-string "\n" (cons (string-join header ",")
                                               (map (lambda (record)
                                                      (string-join (map (lambda (k) (hash-ref record k "")) header) ","))
                                                  data))))
  
  (define output-file (open-output-file file-path))
  (display csv-string output-file)
  (close-output-port output-file))

;; Export to JSON
(define (export-json data file-path)
  (require json)
  (define json-string (pretty-bytes (jsexpr->bytes data)))
  (define output-file (open-output-file file-path))
  (display json-string output-file)
  (close-output-port output-file))

;; Export to TXT
(define (export-txt data file-path)
  (define lines (map (lambda (record)
                       (string-join (map (lambda (k v) (format "~a: ~a" k v)) (hash-keys record) (hash-values record)) "\n"))
                     data))
  (define output-file (open-output-file file-path))
  (display (string-join lines "\n") output-file)
  (close-output-port output-file))

;; Generate summary report
(define (generate-report raw-data processed-data validate-flag transform-rule)
  (format "Original Records: ~a
Processed Records: ~a
Validation Enabled: ~a
Transformation: ~a"
          (length raw-data)
          (length processed-data)
          (if validate-flag "Yes" "No")
          (if transform-rule transform-rule "None")))
