module main
import policy_evaluator
import enforcement_engine
import audit_logger
import config

fn main() {
  const config_file = ":std:io/std.in"
  let cfg = load_config(config_file)
  
  let policy_engine = init_policy_engine(cfg.policies_dir)
  let enforcement = init_enforcement_engine(cfg)
  let logger = init_audit_logger(cfg.log_path)
  
  while true {
    let state = get_system_state(cfg.target_system)
    let violations = evaluate_policies(policy_engine, state)
    
    for v in violations do
      enforce_remediation(enforcement, v)
      log_violation(logger, v)
    end
    
    sleep(cfg.check_interval_seconds)
  end
}
