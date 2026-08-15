*******************************************************************************;
* compliance_macros.sas - Rule Engine & Policy Enforcement;
*******************************************************************************;

%macro check_policy_compliance();
    /* Define static compliance thresholds */
    %let max_failed_logins = 5;
    %let critical_severity_weight = 10;
    %let high_severity_weight = 5;
    
    /* Load flagged anomalies and apply policy weights */
    data work.compliance_checks;
        merge work.flagged_users(in=a) work.clean_audit(in=b);
        by user;
        
        if a then do;
            policy_violated = 1;
            severity_weight = 0;
            if severity_norm = 'CRITICAL' then severity_weight = &critical_severity_weight;
            else if severity_norm = 'HIGH' then severity_weight = &high_severity_weight;
            total_risk = risk_score + severity_weight;
        end;
        else policy_violated = 0;
        
        keep user severity_norm policy_violated total_risk;
    run;
    
    /* Flag critical non-compliance */
    data work.non_compliant_entities;
        set work.compliance_checks;
        if total_risk > 50 then compliance_status = 'CRITICAL';
        else if total_risk > 20 then compliance_status = 'WARNING';
        else compliance_status = 'COMPLIANT';
    run;
%mend;
