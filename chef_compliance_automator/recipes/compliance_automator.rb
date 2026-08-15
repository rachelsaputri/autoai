# recipe[chef_compliance_automator::compliance_automator]
#
# Orchestrates policy parsing, drift detection, remediation, and reporting.
# Guarantees deterministic execution and idempotency.

audit_logger = Chef::ComplianceAutomator::AuditLogger.new(
  log_path: node['chef_compliance_automator']['audit_log_path'],
  strategy: node['chef_compliance_automator']['remediation_strategy']
)

audit_logger.log('INFO', 'Starting compliance automation workflow')

# 1. Policy Ingestion
policy_files = Dir.glob(File.join(node['chef_compliance_automator']['policy_dir'], '*.rb'))
raise 'No compliance policies found' if policy_files.empty?

audit_logger.log('INFO', "Loaded #{policy_files.size} compliance policies")

# 2. Drift Detection & Engine Execution
compliance_engine = Chef::ComplianceAutomator::ComplianceEngine.new(
  policies: policy_files,
  threshold: node['chef_compliance_automator']['compliance_threshold']
)

engine_results = compliance_engine.evaluate

# 3. Remediation (if enabled)
if node['chef_compliance_automator']['remediation_strategy'] == 'enforce'
  engine_results['drifts'].each do |drift|
    audit_logger.log('WARN', "Detected drift: #{drift['resource']} #{drift['expected']} vs #{drift['actual']}")
    # Trigger automated remediation
    compliance_engine.remediate(drift)
  end
end

# 4. Scoring & Reporting
compliance_score = engine_results['score']
audit_logger.log('INFO', "Compliance score: #{compliance_score}%")

# 5. Payload Generation & Dispatch
payload = {
  timestamp: Time.now.utc.iso8601,
  score: compliance_score,
  drifted_resources: engine_results['drifts'],
  status: compliance_score >= node['chef_compliance_automator']['compliance_threshold'] ? 'compliant' : 'non_compliant'
}

audit_logger.log('INFO', 'Compliance payload generated')
Chef::Log.info("Compliance Automation Complete. Score: #{compliance_score}%")
