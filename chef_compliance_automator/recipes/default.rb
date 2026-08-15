# recipe[chef_compliance_automator::default]
#
# Main entry point for the compliance automator.
# Performs directory setup, service configuration, and initial convergence.

if node['chef_compliance_automator']['enabled']
  # Ensure policy directory exists
  directory node['chef_compliance_automator']['policy_dir'] do
    owner 'root'
    group 'root'
    mode '0750'
    action :create
  end

  # Ensure log directory exists
  directory File.dirname(node['chef_compliance_automator']['audit_log_path']) do
    owner 'root'
    group 'adm'
    mode '0750'
    action :create
  end

  # Configure audit logging
  file node['chef_compliance_automator']['audit_log_path'] do
    content "Compliance Automator initialized at #{Time.now.utc.iso8601}\n"
    owner 'root'
    group 'adm'
    mode '0640'
    action :create_if_missing
  end

  # Trigger the compliance engine
  include_recipe 'chef_compliance_automator::compliance_automator'
end
