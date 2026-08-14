use serde::{Deserialize, Serialize};
use std::path::PathBuf;

#[derive(Debug, Deserialize, Serialize, Clone)]
pub struct Config {
    pub ipc_path: PathBuf,
    pub dry_run: bool,
    pub actions: Vec<ActionConfig>,
    pub system_limits: SystemLimits,
}

#[derive(Debug, Deserialize, Serialize, Clone)]
pub struct ActionConfig {
    pub action_type: String,
    pub enabled: bool,
    pub target_pattern: String,
}

#[derive(Debug, Deserialize, Serialize, Clone)]
pub struct SystemLimits {
    pub max_concurrent_actions: usize,
    pub throttle_interval_ms: u64,
}

impl Config {
    pub fn load() -> Result<Self, Box<dyn std::error::Error>> {
        // In a real implementation, load from config file or environment
        Ok(Config {
            ipc_path: PathBuf::from("/tmp/alert_pipe"),
            dry_run: std::env::var("DRY_RUN").unwrap_or_else(|_| "false".to_string()) == "true",
            actions: vec![],
            system_limits: SystemLimits {
                max_concurrent_actions: 100,
                throttle_interval_ms: 10,
            },
        })
    }
} 
