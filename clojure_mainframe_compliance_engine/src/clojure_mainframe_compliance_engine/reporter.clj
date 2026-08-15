ns clojure-mainframe-compliance-engine.reporter
  (:require [clojure.data.json :as json]
            [clojure.java.io :as io]
            [clojure.string :as str])
  (:import [java.io File]))

(defn- write-file
  "Writes content to a file."
  [path content]
  (let [file (File. path)]
    (with-open [w (io/writer file)]
      (.write w content)))

(defn generate-json-report
  "Generates a JSON compliance report."
  [violations path]
  (let [report {:violations violations
                :timestamp (java.time.Instant/now)
                :total-violations (count violations)
                :status (if (empty? violations) "COMPLIANT" "NON-COMPLIANT")}]
    (write-file path (json/write-str report {:pretty true})))

(defn generate-csv-report
  "Generates a CSV compliance report."
  [violations path]
  (let [header "Target,Severity,Detail\n"
        rows (map (fn [v] (str (:target v) "," (:severity v) "," (str/replace (:detail v) "," "\\,") "\n")) violations)
        content (str header (apply str rows))]
    (write-file path content)))

(defn generate-certificate
  "Generates a machine-readable compliance certificate."
  [audit-trail path]
  (let [certificate {:certificate-type "MAINFRAME_COMPLIANCE"
                     :timestamp (java.time.Instant/now)
                     :audit-trail audit-trail
                     :status "VERIFIED"
                     :issuer "Clojure Mainframe Compliance Engine"}]
    (write-file path (json/write-str certificate {:pretty true})))
