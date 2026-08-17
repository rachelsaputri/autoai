/* state_enumerator.rex - ARexx System State Gatherer */

/* Expects global TARGET_CONTEXT to be populated */
enumerate_state: procedure expose TARGET_CONTEXT
    parse arg state_file
    
    if filespec('N', state_file) \= '.dat' then return 'INVALID_FILE_EXTENSION'
    if verify(translate(externalfilespec('D', state_file)), '') = 0 then return 'FILE_NOT_FOUND'
    
    do while lines(state_file) > 0
        state_line = linein(state_file)
        
        /* Expected format: RESOURCE|ATTR_NAME|ATTR_VALUE|CURRENT_STATUS */
        parse var state_line resource '|' attr_name '|' attr_value '|' current_status
        
        if resource = '' | attr_name = '' then iterate
        
        /* Composite key for context lookup */
        ctx_key = strip(resource) || '.' || strip(attr_name)
        
        TARGET_CONTEXT[ctx_key] = strip(attr_value)
        TARGET_CONTEXT[ctx_key '.STATUS'] = strip(current_status)
    end
    
    close state_file
    return 'SUCCESS'
end
