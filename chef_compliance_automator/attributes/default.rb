# Compliance Automator Global Attributes

# Enable or disable the compliance engine
default['chef_compliance_automator']['enabled'] = true

# Compliance policy directory
default['chef_compliance_automator']['policy_dir'] = '/etc/chef/compliance_policies'

# Audit log destination
default['chef_compliance_automator']['audit_log_path'] = '/var/log/chef/compliance_audit.log'

# Remediation strategy (enforce, warn, report)
default['chef_compliance_automator']['remediation_strategy'] = 'enforce'

# Compliance scoring threshold
default['chef_compliance_automator']['compliance_threshold'] = 95

# Drift detection interval in seconds
default['chef_compliance_automator']['drift_interval'] = 300

# Integration webhook for compliance payloads
default['chef_compliance_automator']['webhook_url'] = 'https://compliance-gateway.enterprise.internal/api/v1/payloads'
