(ns clojure-mainframe-compliance-engine.validator
  (:require [clojure.string :as str]))

(defn validate-access-controls
  "Validates access controls against policy constraints."
  [access-controls policy]
  (let [required-permissions (:required-permissions policy {:})
        forbidden-permissions (:forbidden-permissions policy {:})]
    (->> access-controls
         (mapcat (fn [[user permissions]]
                   (let [violation-reasons []]
                     (when (some (fn [p] (contains? permissions p)) forbidden-permissions)
                       (conj violation-reasons (str "User " user " has forbidden permission(s): "
                                                   (str/join ", " (filter (fn [p] (contains? permissions p)) forbidden-permissions)))))
                     (when (not= (set required-permissions) (set permissions))
                       (let [missing (set/difference (set required-permissions) (set permissions))]
                         (when (seq missing)
                           (conj violation-reasons (str "User " user " is missing required permission(s): "
                                                       (str/join ", " missing))))))
                     (when (seq violation-reasons)
                       (map (fn [reason] {:user user :violation reason}) violation-reasons))))))
         vec)))

(defn validate-job-control
  "Validates batch job control blocks."
  [job-control policy]
  (let [required-flags (:required-flags policy {:})
        restricted-resources (:restricted-resources policy {:})
        violations []]
    (doseq [job (get-in job-control [:job-steps])]
      (let [flags (get job :flags [])
            resources (get job :resource-allocations {:})]
        ;; Check for required security flags
        (when-not (every? (fn [flag] (contains? flags flag)) required-flags)
          (conj! violations {:job (get job :job-id "unknown")
                             :violation (str "Missing required flags: " (str/join ", " required-flags))}))
        ;; Check restricted resources
        (doseq [res restricted-resources]
          (when (contains? resources res)
            (conj! violations {:job (get job :job-id "unknown")
                               :violation (str "Unauthorized resource allocation: " res)})))))
    (vec @violations)))

(defn validate
  "Main validation entry point."
  [parsed-config policies]
  (let [security-policy (get policies "system_security_policy" {:})
        job-policy (get policies "batch_job_policy" {:})
        security-violations (validate-access-controls (:access-controls (:security parsed-config)) security-policy)
        job-violations (validate-job-control (:job-control parsed-config) job-policy)]
    (concat security-violations job-violations)))
