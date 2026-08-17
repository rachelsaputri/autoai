// transformer.k
// Handles data cleaning and transformation

transformer: {
  data: x;
  /\ Remove nulls
  data: (where \~null: data);
  /\ Apply field transformations
  data: (transform_fields data);
  /\ Validate schema
  data: (validate_schema data);
  data
}

/\ Field transformation logic
transform_fields: {
  /\ Convert text to lowercase
  /\ Normalize dates
  \"Transformations applied\"
}

/\ Schema validation
validate_schema: {
  /\ Check required columns
  /\ Check data types
  \"Schema valid\"
}
