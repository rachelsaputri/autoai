use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::time::SystemTime;

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct LogEvent {
    pub id: String,
    pub timestamp: SystemTime,
    pub source: String,
    pub level: String,
    pub message: String,
    pub metadata: HashMap<String, String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct PatternMatch {
    pub pattern_id: String,
    pub event_id: String,
    pub score: f64,
    pub matched_text: String,
    pub timestamp: SystemTime,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Anomaly {
    pub anomaly_id: String,
    pub type_: String, // e.g., "brute_force", "data_exfil", "sql_injection"
    pub severity: String, // critical, high, medium, low
    pub confidence: f64,
    pub related_events: Vec<String>,
    pub root_cause_hypothesis: String,
    pub created_at: SystemTime,
    pub context: HashMap<String, String>,
}

#[derive(Debug, Clone)]
pub struct BatchResult {
    pub events_processed: usize,
    pub patterns_matched: usize,
    pub new_anomalies: usize,
}
