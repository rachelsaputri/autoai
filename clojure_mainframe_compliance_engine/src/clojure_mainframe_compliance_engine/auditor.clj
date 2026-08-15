ns clojure-mainframe-compliance-engine.auditor
  (:require [clojure.main :refer [root-cause]]
            [clojure.java.io :as io]
            [clojure.string :as str]))

(defrecord AuditEntry
  [timestamp action target severity details])

(defn create-audit-trail
  "Creates a persistent audit trail based on parsed config and violations."
  [parsed-config violations]
  (let [timestamp (java.time.Instant/now)
        actions []]
    ;; Log initial parse
    (conj! actions (map->AuditEntry {:timestamp timestamp
                                     :action "CONFIG_PARSE"
                                     :target "SYSTEM_CONFIG"
                                     :severity "INFO"
                                     :details "System configuration parsed successfully"}))
    
    ;; Log violations
    (doseq [violation violations]
      (let [severity (cond
                       (contains? violation :user) "WARN"
                       (contains? violation :job) "ERROR"
                       :else "FATAL")]
        (conj! actions (map->AuditEntry {:timestamp timestamp
                                         :action "COMPLIANCE_VIOLATION"
                                         :target (:user violation (:job violation "unknown"))
                                         :severity severity
                                         :details (:violation violation)}))))
    
    ;; Log summary
    (conj! actions (map->AuditEntry {:timestamp timestamp
                                     :action "AUDIT_SUMMARY"
                                     :target "SYSTEM"
                                     :severity "INFO"
                                     :details (str "Total violations: " (count @actions))}))
    
    ;; Convert to vector for immutability
    (vec @actions)))
