// validator.t
// Data Validation Module

class DataValidator
    init
    {
        check(dataSet)
        {
            local valid = [];
            for (local item in dataSet) {
                if (item.value != nil && item.id > 0) {
                    item.status = "validated";
                    valid.append(item);
                }
            }
            return valid;
        }
    }

global validator = new DataValidator();
