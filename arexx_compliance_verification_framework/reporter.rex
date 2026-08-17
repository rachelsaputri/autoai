/* reporter.rex - ARexx Audit Report Generator */

generate_report: procedure expose VERIFICATION_LOG COMPLIANCE_SCORE
    parse arg output_dir
    
    report_file = output_dir || '/compliance_report_' || date('S') || '.json'
    
    /* Open report file */
    rc = stream(report_file, 'C', 'open')
    if rc \= 'READY:' then return 'CANNOT_CREATE_REPORT'
    
    /* Write JSON header */
    say '{"framework":"ARexx_Verification","timestamp":' || timestamp('E') || ',' || '"compliance_score":' || COMPLIANCE_SCORE || ',' || '"checks":['
    
    /* Iterate through verification log */
    n_items = VERIFICATION_LOG~items
    do i = 1 to n_items
        item = VERIFICATION_LOG~item(i)
        
        /* Parse log item: Key, Expected, Actual, Verdict, Pass */
        parse var item req_key expected actual verdict pass
        
        /* Write JSON entry */
        if i < n_items then comma = ','
        say ' {"requirement":"' || req_key || '","expected":"' || expected || '","actual":"' || actual || '","verdict":"' || verdict || '"}' || comma
    end
    
    /* Write JSON footer */
    say ']}'
    
    /* Close report file */
    call stream(report_file, 'C', 'close')
    
    return 'SUCCESS'
end
