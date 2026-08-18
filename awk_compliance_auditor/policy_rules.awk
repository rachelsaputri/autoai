# Policy Rules Module
# This file contains the logic for evaluating compliance policies

function check_compliance(status, value) {
    # Policy 1: Status must be either "VALID" or "INVALID"
    if (status != "VALID" && status != "INVALID") {
        return 0
    }
    
    # Policy 2: Value must be a positive integer
    if (value + 0 != value || value <= 0) {
        return 0
    }
    
    # Policy 3: If status is "INVALID", value must be less than 100
    if (status == "INVALID" && value >= 100) {
        return 0
    }
    
    return 1
}
