#lang racket

;; Main entry point for the Racket Compliance Validator

(require "policy_parser.rkt"
         "state_monitor.rkt"
         "drift_engine.rkt"
         "reporter.rkt")

(provide validate-system)

(define (validate-system policy-dir state-config)
  "Primary function to orchestrate the compliance validation process."
  (define policies (parse-policies policy-dir))
  (define system-state (collect-system-state state-config))
  (define deviations (find-drifts policies system-state))
  (define report (generate-report deviations))
  (write-report report))

;; Example usage
;; (validate-system "./policies" "./config.rkt")

(displayln "Compliance Validator Initialized.")
(displayln "Ready to validate system policies.")
