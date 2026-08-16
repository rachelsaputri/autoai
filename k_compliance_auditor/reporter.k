/ Reporter module for K Compliance Auditor
/ Generates compliance reports and alerts

/ Generate compliance report
generate_report: { [results; output_file]
  header: \"=== Compliance Audit Report ===\n\";
  timestamp: \"Generated: ", str[time[]];
  
  compliant_count: count select _[results where results[3] = `compliant];
  non_compliant_count: count select _[results where results[3] = `non_compliant];
  
  report: header, \n, timestamp, \n,
           \"Compliant: ", str[compliant_count], \n,
           \"Non-Compliant: ", str[non_compliant_count], \n,
           \"===========================\n\";
  
  each[{[r] 
    detail: str[r[0]], ": ", str[r[1]], " vs ", str[r[2]], \n;
    if[r[3] = `non_compliant;
      report,: detail; report,: \"  VIOLATION\n\";
    ;
      report,: detail; report,: \"  OK\n\";
    ];
  } each results];
  
  write_file[output_file; report];
}

/ Generate alert for critical violations
generate_alert: { [violation_info]
  alert_msg: \"CRITICAL: ", str[violation_info[0]], \n,
             \"Expected: ", str[violation_info[1]], \n,
             \"Actual: ", str[violation_info[2]];
  
  // In production, this would trigger email/SMS/pager alerts
}

/ Export results to JSON
export_json: { [results; json_file]
  json_str: \"[\";
  each[{[r] 
    json_str,: \"{\\\"policy\\\":\\\"\", str[r[0]], \"\\\",\\\"expected\\\":\\\"\", str[r[1]], \"\\\",\\\"actual\\\":\\\"\", str[r[2]], \"\\\"},\\\"\";
  } each results];
  json_str: 0 _ json_str; / remove trailing comma
  json_str,: \"]\";
  
  write_file[json_file; json_str];
}
