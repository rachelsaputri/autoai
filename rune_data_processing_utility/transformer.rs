pub fn transform(records: Vec<String>) -> Vec<String> {
    records.into_iter().map(|r| r.to_uppercase()).collect()
}
