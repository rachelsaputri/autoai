name 'chef_compliance_automator'
maintainer 'Enterprise Compliance Team'
maintainer_email 'compliance@enterprise.internal'
license 'MIT'
description 'Installs/Configures chef_compliance_automator'
long_description 'Production-grade Chef-based compliance automation orchestrator for deterministic policy enforcement, drift detection, and automated remediation.'
version '1.0.0'

chef_version '>= 15.0'

supports 'ubuntu', '>= 20.04'
supports 'redhat', '>= 8'
supports 'centos', '>= 8'

depends 'audit_logging'
depends 'drift_detector'
