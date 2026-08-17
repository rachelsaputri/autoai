(define (generate-reports audit-trail output-dir)
  (let violations-json (format-violations-json audit-trail)
    (write-file (join output-dir "audit_report.json") violations-json)
    (let violations-text (format-violations-text audit-trail)
      (write-file (join output-dir "violation_summary.txt") violations-text)))

(define (format-violations-json audit-trail)
  (let json-str "["
    (for entry audit-trail
      (let state (first entry)
        (let policy (second entry)
          (let violation (third entry)
            (set json-str (str json-str 
              "{" 
              "\"state\": \"" state "\"," 
              "\"policy\": \"" policy "\"," 
              "\"violation\": \"" violation "\"}" 
              ","))))
    (set json-str (str json-str "]"))
    json-str)

(define (format-violations-text audit-trail)
  (let text "Compliance Audit Report\n\n"
    (for entry audit-trail
      (let state (first entry)
        (let policy (second entry)
          (let violation (third entry)
            (set text (str text 
              "State: " state "\n"
              "Policy: " policy "\n"
              "Violation: " violation "\n\n")))))
    text)
