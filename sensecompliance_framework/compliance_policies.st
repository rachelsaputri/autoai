# Sample Compliance Policies for SenseTalk Compliance Framework
# Format: type name expected_value

# File Integrity Policies
file_integrity /etc/passwd present
file_integrity /etc/shadow present
file_integrity /etc/ssh/sshd_config present
file_integrity /etc/crontab present

# Network Configuration Policies
network_config firewall_enabled yes
network_config port_22_open no
network_config port_80_open yes
network_config port_443_open yes

# User Access Policies
user_access admin_access restricted
user_access guest_access none
user_access root_access disabled

# Service Status Policies
service_status sshd running
service_status httpd stopped
service_status ntpd running
