#lang racket

;; main.rkt - Entry point and CLI interface for Data Processing Utility

(require "ingestor.rkt"
         "validator.rkt"
         "transformer.rkt"
         "reporter.rkt"
         "utils.rkt")

(provide main)

;; Parse command-line arguments
(define (parse-args args)
  (define-values (in-out-args opt-res err-res)
    (command-line
     #:prog "racket-data-processor"
     #:usage-help "Process data files with validation and transformation."
     #:once-any
     [("--input") in-file "Input file path"]
     [("--format") in-format "Input format (csv, json, txt). Default: csv"]
     [("--format-out") out-format "Output format (csv, json, txt). Default: input format"]
     [("--output") out-file "Output file path"]
     [("--transform") transform-rule "Transformation rule to apply"]
     [("--validate") do-validate "Enable data validation"]
     #:args (rest-args)
     (if (empty? rest-args)
         (values (list in-file in-format out-format out-file transform-rule do-validate) empty empty)
         (error "Unexpected arguments: ~a" rest-args))))
  
  (define in-file (first in-out-args))
  (define in-format (second in-out-args))
  (define out-format (third in-out-args))
  (define out-file (fourth in-out-args))
  (define transform-rule (fifth in-out-args))
  (define do-validate (sixth in-out-args))

  (list in-file
        (if in-format in-format "csv")
        (if out-format out-format in-format)
        out-file
        (if transform-rule transform-rule #f)
        (if do-validate #t #f)))

;; Main execution flow
(define (main)
  (define args (current-command-line-arguments))
  (define config (parse-args args))
  
  (define in-file (first config))
  (define in-format (second config))
  (define out-format (third config))
  (define out-file (fourth config))
  (define transform-rule (fifth config))
  (define do-validate (sixth config))
  
  (unless in-file
    (error "Input file is required. Use --input <file>"))
  
  (displayln "Starting data processing...")
  
  ;; 1. Ingest Data
  (define raw-data (try/catch
                     (ingest-data in-file in-format)
                     (exn? (lambda (e) (displayln (format "Ingestion Error: ~a" (exn-message e))) (exit 1)))))
  
  (when (empty? raw-data)
    (displayln "No data ingested. Exiting.")
    (exit 0))
  
  (displayln (format "Ingested ~a records." (length raw-data)))
  
  ;; 2. Validate Data (if requested)
  (define validated-data
    (if do-validate
        (try/catch
          (validate-data raw-data)
          (exn? (lambda (e) (displayln (format "Validation Error: ~a" (exn-message e))) (exit 1))))
        raw-data))
  
  (when do-validate
    (displayln "Data validation passed."))
  
  ;; 3. Transform Data (if requested)
  (define processed-data
    (if transform-rule
        (try/catch
          (transform-data validated-data transform-rule)
          (exn? (lambda (e) (displayln (format "Transformation Error: ~a" (exn-message e))) (exit 1))))
        validated-data))
  
  (when transform-rule
    (displayln (format "Applied transformation: ~a" transform-rule)))
  
  ;; 4. Report/Export Data
  (if out-file
      (try/catch
        (export-data processed-data out-file out-format)
        (exn? (lambda (e) (displayln (format "Export Error: ~a" (exn-message e))) (exit 1))))
      (displayln (format "Processed ~a records." (length processed-data))))
  
  (displayln "Data processing completed successfully.")
  
  ;; Generate a summary report to standard output
  (define report (generate-report raw-data processed-data do-validate transform-rule))
  (displayln "\n--- Summary Report ---")
  (displayln report)
  (displayln "----------------------")
  
  0) ;; Success exit code

;; Helper for try/catch
(define-syntax-rule (try/catch expr handler)
  (with-handlers ([exn? handler])
    expr))

;; Run main if executed directly
(if (equal? (vector-ref (current-command-line-arguments) 0) #f)
    (main)
    (void))
