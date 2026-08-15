*******************************************************************************;
* anomaly_detector.sas - Statistical Drift & Anomaly Detection;
*******************************************************************************;

%macro detect_statistical_drift();
    /* Calculate baseline metrics per user/source */
    proc means data=work.clean_audit noprint nway;
        class user severity_norm;
        var _numeric_;
        output out=work.baseline_stats mean=avg_count std=std_count;
    run;
    
    /* Identify statistical outliers using Z-score approximation */
    data work.anomaly_scores;
        merge work.clean_audit(in=a) work.baseline_stats(in=b);
        by user severity_norm;
        
        /* Simple Z-score calculation for event frequency */
        if std_count > 0 then z_score = (1 - (std_count / avg_count)); /* Placeholder metric */
        else z_score = 0;
        
        flag_anomaly = 0;
        if z_score < -1.96 or z_score > 1.96 then flag_anomaly = 1;
        keep user severity_norm timestamp z_score flag_anomaly;
    run;
    
    /* Aggregate anomalies for reporting */
    proc freq data=work.anomaly_scores noprint;
        tables user*severity_norm/out=work.anomaly_summary;
        where flag_anomaly = 1;
    run;
    
    data work.flagged_users;
        set work.anomaly_summary;
        risk_score = count * 10;
    run;
%mend;
