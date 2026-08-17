(import parser)
(import validator)
(import reporter)

(define (load-policies directory)
  (let policies '()
    (for file (directory-files directory)
      (when (ends-with file ".arc")
        (set policies (append policies (parse-policy-file directory/file)))))
    policies))

(define (load-state directory)
  (let states '()
    (for file (directory-files directory)
      (when (ends-with file ".arc")
        (set states (append states (parse-state-file directory/file)))))
    states))

(define (run-verification policies states output-dir)
  (let audit-trail '()
    (for policy policies
      (for state states
        (let violations (validate-policy-against-state policy state)
          (when (not (null? violations))
            (set audit-trail (append audit-trail (map (lambda (v) (list state policy v)) violations)))))))
    (generate-reports audit-trail output-dir)))

(define (main)
  (let policies (load-policies "policies")
    (let states (load-state "state")
      (if (or (null? policies) (null? states))
        (print "Error: No policies or states loaded.")
        (run-verification policies states "output")))))

(main)
