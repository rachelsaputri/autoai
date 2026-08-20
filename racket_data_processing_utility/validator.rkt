#lang racket

;; validator.rkt - Data validation module

(provide validate-data)

;; Validate data records
(define (validate-data data)
  (define valid-records '())
  (define invalid-count 0)
  
  (for-each (lambda (record)
              (if (is-valid-record? record)
                  (set! valid-records (cons record valid-records))
                  (set! invalid-count (add1 invalid-count))))
            data)
  
  (when (> invalid-count 0)
    (error (format "Validation failed: ~a invalid records" invalid-count)))
  
  (reverse valid-records))

;; Check if a single record is valid
(define (is-valid-record? record)
  (and (hash? record)
       (not (hash-empty? record))
       ;; Add specific field validation if schema is known
       ;; For now, just check that it's not empty
       (every (lambda (k) (not (string=? (hash-ref record k "")))) (hash-keys record))))
