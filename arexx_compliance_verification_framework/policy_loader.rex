/* policy_loader.rex - ARexx Policy Parser and Validator */

/* Expects global BASELINE_POLICY to be populated */
load_policy: procedure expose BASELINE_POLICY
    parse arg policy_file
    if filespec('N', policy_file) \= '.pcy' then return 'INVALID_FILE_EXTENSION'
    
    /* Check file existence */
    if verify(translate(externalfilespec('D', policy_file)), '') = 0 then return 'FILE_NOT_FOUND'
    
    /* Read and parse */
    do while lines(policy_file) > 0
        policy_line = linein(policy_file)
        
        /* Skip comments and empty lines */
        if strip(policy_line) = '' | left(strip(policy_line), 2) = '/*' then iterate
        
        /* Parse KEY:VALUE format */
        parse var policy_line key ':' value
        key = strip(key)
        value = strip(value)
        
        if key = '' | value = '' then iterate
        
        /* Store in hash */
        BASELINE_POLICY[key] = value
    end
    
    close policy_file
    
    /* Validate required fields */
    required_fields = 'POLICY_VERSION|SEVERITY_MATRIX|REMEDIATION_ACTION'
    do i = 1 to words(required_fields)
        field = word(required_fields, i)
        if BASELINE_POLICY[field] = '' then return 'MISSING_REQUIRED_FIELD:' field
    end
    
    return 'SUCCESS'
end
