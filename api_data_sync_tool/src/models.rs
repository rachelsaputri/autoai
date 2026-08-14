use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct AnomalyData {
    pub id: String,
    pub timestamp: String,
    pub severity: String,
    pub payload: String,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct SyncResponse {
    pub accepted: bool,
    pub message: String,
}
