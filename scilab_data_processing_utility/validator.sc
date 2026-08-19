function [valid_data, errors] = validate_data(data)
    // Validates data matrix for missing values (NaN/Inf) and basic integrity
    // Returns cleaned data and list of errors
    
    errors = [];
    valid_data = data;
    
    // Check for NaN values
    nan_count = sum(isnan(valid_data));
    if nan_count > 0 then
        errors = [errors; "Found " + string(nan_count) + " NaN values"];
        // Replace NaN with mean of column
        for i = 1:size(valid_data, 2)
            col_mean = mean(valid_data(:, i));
            idx = find(isnan(valid_data(:, i)));
            if ~isempty(idx) then
                valid_data(idx, i) = col_mean;
            end
        end
    end
    
    // Check for Inf values
    inf_count = sum(isinf(valid_data));
    if inf_count > 0 then
        errors = [errors; "Found " + string(inf_count) + " Inf values"];
        // Replace Inf with max finite value of column
        for i = 1:size(valid_data, 2)
            col_vals = valid_data(:, i);
            finite_vals = col_vals(isfinite(col_vals));
            if ~isempty(finite_vals)
                max_val = max(finite_vals);
                idx = find(isinf(valid_data(:, i)));
                valid_data(idx, i) = max_val;
            end
        end
    end
    
    // Check for empty data
    if size(valid_data, 1) == 0 | size(valid_data, 2) == 0
        errors = [errors; "Data is empty"];
    end
    
endfunction
