(ns clojure-mainframe-compliance-engine.parser
  (:require [clojure.data.json :as json]
            [clojure.java.io :as io]
            [clojure.string :as str])
  (:import [java.io File]))

(defn load-system-config
  "Loads the mainframe system configuration from a JSON file."
  [path]
  (let [file (io/file path)]
    (if (.exists file)
      (with-open [r (io/reader file)]
        (json/read-json r :key-fn keyword))
      (throw (Exception. (str "Configuration file not found: " path))))))

(defn load-policies
  "Loads compliance policies from a directory."
  [dir-path]
  (let [dir (io/file dir-path)
        files (.listFiles dir)]
    (into {}
          (map (fn [f]
                 (let [name (.getName f)
                       policy-name (str/replace name #"\\.json$" "")
                       content (slurp f)]
                   [policy-name (json/read-json content :key-fn keyword)]))
               (filter #(and (.isFile %)
                            (.endsWith (.getName %) ".json"))
                       files)))))

(defn parse-config
  "Normalizes the system configuration into a standard format for validation."
  [raw-config]
  ;; Extract key sections for validation
  (let [security-section (:security raw-config {:})
        job-control-section (:batch-job-control raw-config {:})]
    {:security (merge {:access-controls (:access-controls security-section {:})
                       :permissions (:permissions security-section {:})
                       :encryption (:encryption security-section {:})}]
     :job-control (merge {:job-steps (:job-steps job-control-section {:})
                          :resource-allocations (:resource-allocations job-control-section {:})
                          :security-flags (:security-flags job-control-section {:})}]
     :system-info (:system-info raw-config {:}))
  )
