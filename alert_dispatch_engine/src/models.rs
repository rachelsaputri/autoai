use serde::{Deserialize, Serialize};

#[derive(Debug, Deserialize, Serialize, Clone)]
pub struct Metric {
    pub name: String,
    pub value: f64,
    pub timestamp: u64,
}

#[derive(Debug, Serialize, Clone)]
pub struct Alert {
    pub rule_name: String,
    pub metric: Metric,
    pub severity: String,
    pub timestamp: u64,
}
