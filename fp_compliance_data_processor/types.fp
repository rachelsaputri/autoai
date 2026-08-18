-- Type Definitions for Compliance Data Processor

type Record = 
    Map<String, Value>
    
and Value = 
    | Null
    | Bool of Boolean
    | Int of Integer
    | Float of Number
    | String of String
    | DateTime of Date
    
and ValidationRule =
    {
        field: String,
        type: String,
        required: Boolean
    }
    
and ProcessingError =
    {
        record_index: Integer,
        field: String,
        error_type: String,
        message: String
    }

-- Helper type constructors
nil_record() = Map{}
empty_error(idx, field, msg) =
    {record_index: idx, field: field, error_type: "validation", message: msg}
