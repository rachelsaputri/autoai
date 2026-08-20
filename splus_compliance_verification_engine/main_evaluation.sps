# main_evaluation.sps
# Compliance Verification Engine - Entry Point
# Fully functional S-PLUS implementation

source("policy_parser.sps")
source("state_collector.sps")
source("compliance_checker.sps")
source("report_generator.sps")

#' Run the full compliance engine pipeline
#' @param policy_dir Character. Path to directory containing policy files.
#' @param state_dir Character. Path to directory containing system state snapshots.
#' @param report_path Character. Output path for the generated JSON report.
#' @return List containing compliance score, policy evaluation results, and audit log.
run_compliance_engine <- function(policy_dir = "./policies",
                                  state_dir = "./snapshots",
                                  report_path = "./reports/compliance_report.json") {

  # 1. Initialize engine state
  cat("[INIT] Starting Compliance Verification Engine...\n")
  engine_start_time <- Sys.time()
  audit_log <- list()

  # 2. Parse policies
  cat("[PARSE] Loading and validating policy definitions...\n")
  policies <- load_policies(policy_dir)
  if (length(policies) == 0) {
    stop("[ERROR] No valid policies found in ", policy_dir)
  }
  audit_log$policy_count <- length(policies)

  # 3. Collect system state
  cat("[COLLECT] Gathering system state snapshots...\n")
  state_data <- collect_system_state(state_dir)
  if (is.null(state_data)) {
    stop("[ERROR] Failed to collect system state from ", state_dir)
  }
  audit_log$state_timestamp <- Sys.time()

  # 4. Run compliance checks
  cat("[CHECK] Evaluating state against policies...\n")
  results <- evaluate_compliance(policies, state_data)

  # 5. Calculate scores
  cat("[SCORE] Computing compliance metrics...\n")
  metrics <- calculate_compliance_metrics(results)
  audit_log$evaluation_time <- difftime(Sys.time(), engine_start_time, units = "secs")

  # 6. Generate report
  cat("[REPORT] Generating compliance report...\n")
  generate_report(results = results,
                  metrics = metrics,
                  audit_log = audit_log,
                  output_path = report_path)

  cat("[COMPLETE] Compliance engine finished. Report saved to ", report_path, "\n")
  return(list(
    metrics = metrics,
    results = results,
    audit_log = audit_log
  ))
}

# Execute if sourced or run directly
if (!interactive()) {
  args <- commandArgs(trailingOnly = FALSE)
  # Default execution for demonstration
  run_compliance_engine()
}
