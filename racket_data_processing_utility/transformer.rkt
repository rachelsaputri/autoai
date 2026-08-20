#lang racket

;; transformer.rkt - Data transformation module

(provide transform-data)

;; Transform data based on rule
(define (transform-data data rule)
  (map (lambda (record)
         (transform-record record rule))
       data))

;; Transform a single record
(define (transform-record record rule)
  (cond
    [(equal? rule "uppercase")
     (hash-map record (lambda (k v)
                        (if (string? v)
                            (string-upcase v)
                            v)))]
    [(equal? rule "lowercase")
     (hash-map record (lambda (k v)
                        (if (string? v)
                            (string-downcase v)
                            v)))]
    [(equal? rule "trim")
     (hash-map record (lambda (k v)
                        (if (string? v)
                            (string-trim v)
                            v)))]
    [(equal? rule "filter_empty")
     ;; Filter out records with empty values in any field
     (if (any-empty? record)
         #f ;; Signal to filter out
         record)]
    [else (error (format "Unknown transformation rule: ~a" rule))]))

;; Helper to check if any value in record is empty string
(define (any-empty? record)
  (any (lambda (v) (string=? v "")) (hash-values record)))
