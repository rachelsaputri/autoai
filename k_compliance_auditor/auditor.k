/ Core auditing logic for K Compliance Auditor

/ Audit a single system configuration against policies
audit_system: { [policies; configs]
  results: ();
  each[{[p; c] check_policy[p; c]} each policies; configs];
}

/ Check a single policy against a configuration
check_policy: { [policy; config]
  policy_type: policy[0];
  expected: policy[1];
  actual: lookup_value[config; policy_type];
  
  if[actual ~ expected;
    results:, `compliant; ::
  ;
    results:, `non_compliant; 
    log_violation[policy; actual; expected];
  ];
  
  (policy_type; expected; actual; results)
}

/ Lookup value in configuration
lookup_value: { [config; key]
  if[key in config;
    config[key]; :: \n\"\" ];
}

/ Log a violation
log_violation: { [policy; actual; expected]
  violation_record: (time[]; policy; actual; expected; `violation);
  // In a real system, this would write to a secure log
}
