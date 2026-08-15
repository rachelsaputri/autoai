(defproject clojure-mainframe-compliance-engine "1.0.0-SNAPSHOT"
  :description "A production-grade mainframe compliance verification and auditing engine."
  :url "https://example.com/clojure-mainframe-compliance"
  :license {:name "MIT"
            :url "https://opensource.org/licenses/MIT"}
  :dependencies [[org.clojure/clojure "1.11.1"]
                 [org.clojure/data.json "2.4.0"]
                 [org.clojure/core.async "1.6.673"]
                 [techascent/tech.json "0.5.10"]
                 [com.google.guava/guava "31.1-jre"]]
  :main ^:skip-aot clojure-mainframe-compliance-engine.core
  :source-paths ["src"]
  :resource-paths ["resources"]
  :java-source-paths ["java"]
  :aot [clojure-mainframe-compliance-engine.core]
  :profiles {:dev {:dependencies [[pjstadig/humane-test-output "0.11.0"]
                                  [org.clojure/test.check "1.1.1"]]
                   :repl-options {:init-ns clojure-mainframe-compliance-engine.core}}})
