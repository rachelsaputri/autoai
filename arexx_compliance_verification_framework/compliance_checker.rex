/* compliance_checker.rex - ARexx Core Verification Logic */

/* Expects BASELINE_POLICY, TARGET_CONTEXT, COMPLIANCE_SCORE, VERIFICATION_LOG */
run_compliance_check: procedure expose BASELINE_POLICY TARGET_CONTEXT COMPLIANCE_SCORE VERIFICATION_LOG
    total_checks = 0
    passed_checks = 0
    policy_version = BASELINE_POLICY['POLICY_VERSION']
    severity_matrix = BASELINE_POLICY['SEVERITY_MATRIX']
    
    /* Iterate through all baseline requirements */
    do pc over BASELINE_POLICY
        req_key = strip(pc)
        req_value = strip(BASELINE_POLICY[pc])
        
        /* Skip metadata keys */
        if req_key = 'POLICY_VERSION' | req_key = 'SEVERITY_MATRIX' | req_key = 'REMEDIATION_ACTION' then iterate
        
        total_checks = total_checks + 1
        
        /* Map requirement key to context key */
        ctx_key = req_key
        expected_value = req_value
        
        /* Perform comparison */
        if TARGET_CONTEXT[ctx_key] = '' then do
            verdict = 'MISSING_RESOURCE'
            compliance = 0
        end else if TARGET_CONTEXT[ctx_key] = expected_value then do
            verdict = 'COMPLIANT'
            compliance = 1
        end else do
            verdict = 'NON_COMPLIANT'
            compliance = 0
        end
        
        /* Log result */
        call VERIFICATION_LOG~insert(req_key, expected_value, TARGET_CONTEXT[ctx_key], verdict, compliance)
        
        if compliance = 1 then passed_checks = passed_checks + 1
    end
    
    /* Calculate score */
    if total_checks > 0 then do
        COMPLIANCE_SCORE = (passed_checks * 100) % total_checks
    end else do
        COMPLIANCE_SCORE = 100
    end
    
    return 'SUCCESS'
end
