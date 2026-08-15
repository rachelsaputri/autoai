*******************************************************************************;
* data_processor.sas - Ingestion and Normalization Module;
*******************************************************************************;

%macro import_raw_logs();
    /* Import raw audit logs (assumes pipe-delimited .txt or .csv) */
    data work.raw_audit;
        length event_type $50 source_ip $20 user $30 severity $15;
        infile "&data_dir.\*.txt" delimiter='|' dsd truncover;
        input timestamp $ event_type $ source_ip $ user $ severity $ details $200.;
        format timestamp datetime19.;
    run;
    
    proc import datafile="&data_dir.mappings.csv" 
        out=work.mapping_table 
        dbms=csv 
        replace;
        getnames=yes;
    run;
%mend;

%macro clean_and_normalize();
    data work.normalized_audit;
        set work.raw_audit;
        
        /* Standardize severity levels */
        severity_norm = upcase(severity);
        if findw('CRITICAL HIGH MEDIUM LOW INFO', severity_norm) = 0 then severity_norm = 'UNKNOWN';
        
        /* Validate IP addresses */
        ip_valid = verify(source_ip, '0123456789.');
        if length(source_ip) ne 7 and ip_valid > 0 then source_ip = '0.0.0.0';
        
        /* Filter out noise events */
        keep timestamp event_type source_ip user severity_norm details;
    run;
    
    proc sort data=work.normalized_audit out=work.clean_audit;
        by timestamp;
    run;
%mend;
