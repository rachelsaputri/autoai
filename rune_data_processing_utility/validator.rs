pub fn validate(records: Vec<String>) -> Vec<String> {
    records.into_iter().filter(|r| !r.is_empty()).collect()
}
