;; Arc Formal Compliance Policy Evaluator
;; This script implements the core logic for parsing, evaluating, and generating proof traces for compliance policies.

;; Global variables for storing parsed policies and states
(def *policy-defs* '())
(def *state-defs* '())
(def *evaluation-results* '())

;; Read a file and return its contents as a string
(def read-file (filename)
  (with file (open filename)
    (read file)))

;; Parse a policy definition from a list
(def parse-policy (expr)
  (if (is (car expr) 'defpolicy)
    (let name (cadr expr)
      (let policy (caddr expr)
        (push (list name policy) *policy-defs*)
        (cons name policy)))))

;; Parse a state definition from a list
(def parse-state (expr)
  (if (is (car expr) 'defstate)
    (let name (cadr expr)
      (let state (caddr expr)
        (push (list name state) *state-defs*)
        (cons name state)))))

;; Evaluate a rule against a state
(def evaluate-rule (rule state)
  (let rule-name (car rule)
    (let rule-body (cadr rule)
      (let result (eval-rule-body rule-body state)
        (cons rule-name result)))))

;; Evaluate the body of a rule
(def eval-rule-body (body state)
  (cond
    ((is (car body) 'and)
     (let sub-expressions (cdr body)
       (eval-all sub-expressions state)))
    ((is (car body) 'or)
     (let sub-expressions (cdr body)
       (eval-any sub-expressions state)))
    ((is (car body) 'not)
     (let sub-expression (cadr body)
       (not (eval-expression sub-expression state))))
    (t
     (eval-expression body state))))

;; Evaluate a list of expressions
(def eval-all (expressions state)
  (if (is expressions '())
    t
    (let first (car expressions)
      (let rest (cdr expressions)
        (if (is (eval-expression first state) t)
          (eval-all rest state)
          (cons nil '()))))))

;; Evaluate any of a list of expressions
(def eval-any (expressions state)
  (if (is expressions '())
    nil
    (let first (car expressions)
      (let rest (cdr expressions)
        (if (is (eval-expression first state) t)
          t
          (eval-any rest state))))))

;; Evaluate a single expression
(def eval-expression (expr state)
  (cond
    ((is (car expr) '>=)
     (let val1 (eval-expression (cadr expr) state)
       (let val2 (eval-expression (caddr expr) state)
         (if (and (number? val1) (number? val2))
           (>= val1 val2)
           nil))))
    ((is (car expr) 'length)
     (let val (eval-expression (cadr expr) state)
       (if (string? val)
         (length val)
         nil)))
    ((is (car expr) 'contains)
     (let val (eval-expression (cadr expr) state)
       (let sub (eval-expression (caddr expr) state)
         (if (and (string? val) (string? sub))
           (contains val sub)
           nil))))
    ((is (car expr) 'member)
     (let val (eval-expression (cadr expr) state)
       (let lst (eval-expression (caddr expr) state)
         (if (and (not (nil? val)) (is? 'list lst))
           (member val lst)
           nil))))
    ((is? 'symbol (car expr))
     (let symbol (car expr)
       (get state symbol)))
    ((is? 'string (car expr))
     (eval-expression (car expr) state))
    ((is? 'number (car expr))
     (eval-expression (car expr) state))
    (t
     nil)))

;; Evaluate a policy against a state
(def evaluate-policy (policy state)
  (let result (eval-rule-body policy state)
    (cons result '())))

;; Generate a proof trace for a rule evaluation
(def generate-proof-trace (rule state)
  (let rule-name (car rule)
    (let rule-body (cadr rule)
      (let details (generate-proof-trace-details rule-body state)
        (cons rule-name details)))))

;; Generate details for a proof trace
(def generate-proof-trace-details (body state)
  (cond
    ((is (car body) 'and)
     (let sub-expressions (cdr body)
       (map (fn (expr)
              (generate-proof-trace-details expr state))
            sub-expressions)))
    ((is (car body) 'or)
     (let sub-expressions (cdr body)
       (map (fn (expr)
              (generate-proof-trace-details expr state))
            sub-expressions)))
    ((is (car body) 'not)
     (let sub-expression (cadr body)
       (generate-proof-trace-details sub-expression state)))
    (t
     (let expr body
       (let result (eval-expression expr state)
         (cons expr result))))))

;; Main function to run the evaluator
(def main (policy-file state-file)
  (let policy-expr (read-file policy-file)
    (let state-expr (read-file state-file)
      (parse-policy policy-expr)
      (parse-state state-expr)
      (let policy (car (car *policy-defs*))
        (let policy-body (cadr (car *policy-defs*))
          (let state (cadr (car *state-defs*))
            (let evaluation-result (evaluate-policy policy-body state)
              (let proof-trace (generate-proof-trace (car (car *policy-defs*)) state)
                (let results (list '())
                  (push (list 'policy policy 'status (if (is evaluation-result t) 'passed 'failed) 'proof-traces (list proof-trace)) results)
                  (write-json (car results) "evaluation_results.json")))))))))

;; Helper function to write JSON output
(def write-json (data filename)
  (with file (open filename 'write)
    (write file (json-encode data))))

;; Start the evaluator if this file is being run directly
(if (is (car *command-line*) "evaluator.arc")
  (main (cadr *command-line*) (caddr *command-line*)))
