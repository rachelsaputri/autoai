function [transformed_data, method] = transform_data(data, mode)
    // Transforms data based on the specified mode
    // Modes: "normalize", "standardize", "log", "identity"
    
    transformed_data = data;
    method = mode;
    
    select mode
        case "normalize" then
            // Min-Max Normalization
            min_vals = min(data);
            max_vals = max(data);
            ranges = max_vals - min_vals;
            // Avoid division by zero
            ranges(ranges == 0) = 1;
            transformed_data = (data - min_vals) ./ ranges;
        
        case "standardize" then
            // Z-score Standardization
            means = mean(data);
            stds = stdev(data);
            // Avoid division by zero
            stds(stds == 0) = 1;
            transformed_data = (data - means) ./ stds;
        
        case "log" then
            // Log Transformation (shift to avoid log(0))
            min_val = min(data);
            shift = min_val;
            if shift <= 0 then shift = 0 - min_val + 1; end
            transformed_data = log(data + shift);
        
        case "identity" then
            // No transformation
            transformed_data = data;
        
        else
            warning("Unknown transformation mode: " + mode + ". Returning original data.");
            transformed_data = data;
            method = "unknown";
    end
    
endfunction
