use serde::{Deserialize, Serialize};

#[derive(Debug, Deserialize, Serialize, Clone)]
pub struct Alert {
    pub id: String,
    pub severity: u8,
    pub action_type: String,
    pub target: String,
    pub payload: serde_json::Value,
} 
