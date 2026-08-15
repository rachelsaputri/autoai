(ns clojure-mainframe-compliance-engine.core
  (:require [clojure-mainframe-compliance-engine.parser :as parser]
            [clojure-mainframe-compliance-engine.validator :as validator]
            [clojure-mainframe-compliance-engine.auditor :as auditor]
            [clojure-mainframe-compliance-engine.reporter :as reporter]
            [clojure.data.json :as json]
            [clojure.java.io :as io]
            [clojure.string :as str])
  (:gen-class))

(defn -main
  [& args]
  (let [config-path (first args)
        _ (println "Starting Mainframe Compliance Engine...")
        ;; 1. Load Configuration and Policies
        _ (println "Loading configuration and policies...")
        policies (parser/load-policies "resources/policies")
        system-config (parser/load-system-config config-path)
        
        ;; 2. Parse System Configuration
        _ (println "Parsing system configuration...")
        parsed-config (parser/parse-config system-config)
        
        ;; 3. Validate against Policies
        _ (println "Validating against compliance constraints...")
        violations (validator/validate parsed-config policies)
        
        ;; 4. Generate Audit Trail
        _ (println "Generating audit trail...")
        audit-trail (auditor/create-audit-trail parsed-config violations)
        
        ;; 5. Generate Reports
        _ (println "Generating compliance reports...")
        (reporter/generate-json-report violations "compliance_report.json")
        (reporter/generate-csv-report violations "compliance_report.csv")
        
        ;; 6. Generate Certificate
        (if (empty? violations)
          (do
            (println "Compliance verified. Generating certificate...")
            (reporter/generate-certificate audit-trail "compliance_certificate.json"))
          (println "Compliance violations detected. Certificate not generated."))
        
        ;; 7. Output Summary
        (println "Total violations found:" (count violations))
        (println "Engine execution completed.")
        )
  )
