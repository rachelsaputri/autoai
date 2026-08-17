(define (validate-policy-against-state policy state)
  (let violations '()
    (let conditions (extract conditions policy)
      (let files (extract files state)
        (let file-content (load-file-content (intersect conditions files))
          (let rules (extract rules policy)
            (for rule rules
              (let match (check-rule rule file-content)
                (when (not match)
                  (set violations (append violations (list rule)))))))))
    violations))

(define (extract type item)
  (filter (lambda (x) (eq? (car x) type)) item))

(define (intersect list1 list2)
  (filter (lambda (x) (member x list2)) list1))

(define (load-file-content files)
  (let content '()
    (for file files
      (set content (append content (read-file (second file)))))
    content))

(define (check-rule rule content)
  (let parts (str-split rule #\space)
    (let key (first parts)
      (let value (second parts)
        (if (contains content key)
          (let idx (index content key)
            (let val (index content (add idx 1))
              (if (string= val value)
                #t #t))
          #f))
      #f)))

(define (contains list item)
  (let idx (index list item)
    (if (null? idx) #f #t)))

(define (index list item)
  (let idx 0
    (for x list
      (when (string= x item)
        (return idx))
      (set idx (add idx 1)))
    #f))

(define (read-file path)
  (let lines (file-read-lines path)
    (let tokens '()
      (for line lines
        (set tokens (append tokens (str-split line #\space)))))
    tokens))
