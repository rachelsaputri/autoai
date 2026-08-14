use serde::{Deserialize, Serialize};

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CorrelatedAlert {
    pub id: String,
    pub timestamp: i64,
    pub source_ip: String,
    pub dest_ip: String,
    pub alert_type: String,
    pub severity: u8,
    pub metadata: std::collections::HashMap<String, String>,
}

#[derive(Debug, Clone)]
pub struct EventStream {
    pub events: Vec<CorrelatedAlert>,
    pub window_duration_ms: u64,
}

impl EventStream {
    pub fn new(events: Vec<CorrelatedAlert>, window_duration_ms: u64) -> Self {
        Self {
            events,
            window_duration_ms,
        }
    }
    
    pub fn is_empty(&self) -> bool {
        self.events.is_empty()
    }
}
