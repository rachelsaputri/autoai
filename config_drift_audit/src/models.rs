use serde::{Serialize, Deserialize};
use chrono::DateTime;
use chrono::Utc;

#[derive(Debug, Serialize, Deserialize)]
pub enum AuditLog {
    Drift(DriftEvent),
}

#[derive(Debug, Serialize, Deserialize)]
pub struct DriftEvent {
    pub timestamp: DateTime<Utc>,
    pub path: String,
    pub previous_hash: Option<String>,
    pub current_hash: String,
    pub severity: String,
}
