*******************************************************************************;
* run_pipeline.sas - Master Entry Point for SAS Security Compliance Analyzer;
*******************************************************************************;

%macro run_compliance_analysis();
    /* 1. Environment Setup */
    options nosource nonotes nodate;
    %let data_dir = ./data/;
    %let out_dir = ./output/;
    libname outlib "&out_dir";
    
    /* 2. Data Ingestion */
    %include 'data_processor.sas';
    %import_raw_logs();
    %clean_and_normalize();
    
    /* 3. Statistical Analysis & Anomaly Detection */
    %include 'anomaly_detector.sas';
    %detect_statistical_drift();
    
    /* 4. Compliance Rule Enforcement */
    %include 'compliance_macros.sas';
    %check_policy_compliance();
    
    /* 5. Report Generation */
    %include 'report_generator.sas';
    %generate_compliance_report();
    
    %put NOTE: Compliance analysis pipeline completed successfully.;
%mend;

/* Execute Pipeline */
%run_compliance_analysis();
