;; justification_generator.lisp
;; This file contains the justification generator for the Lisp Policy Verification Engine.
;; It generates justifications based on the verification results.

(defun generate-justification (result)
  "Generates a justification based on the verification result."
  (cond
    ((equalp result "Alert matches policy") "The alert matches the policy, hence the action is justified.")
    ((equalp result "Alert does not match policy") "The alert does not match the policy, hence the action is not justified.")
    (t "Unknown result, justification cannot be generated.")))

;; End of justification_generator.lisp
