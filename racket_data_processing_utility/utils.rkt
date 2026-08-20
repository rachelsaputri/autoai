#lang racket

;; utils.rkt - Utility functions

(provide try/catch any string-trim)

;; Try/catch helper
(define-syntax-rule (try/catch expr handler)
  (with-handlers ([exn? handler])
    expr))

;; Helper for 'any' if not available in older Racket versions
(define (any pred lst)
  (cond
    [(empty? lst) #f]
    [(pred (first lst)) #t]
    [else (any pred (rest lst))]))

;; String trim helper if not built-in
(define (string-trim str)
  (regexp-replaces str `((#rx"^[ \\t\\n\\r]+" "")
                         (#rx"[ \\t\\n\\r]+$" "")))
