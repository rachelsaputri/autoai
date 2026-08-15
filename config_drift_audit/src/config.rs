use serde::{Serialize, Deserialize};
use std::fs;
use std::path::PathBuf;

#[derive(Debug, Serialize, Deserialize)]
pub struct AppConfig {
    pub watch_directory: String,
    pub auto_remediate: bool,
    pub log_level: String,
    pub baseline_store_path: String,
}

impl AppConfig {
    pub fn load() -> Result<Self, Box<dyn std::error::Error>> {
        let config_path = PathBuf::from("config_drift_audit/config.json");
        if config_path.exists() {
            let config_str = fs::read_to_string(config_path)?;
            let config: AppConfig = serde_json::from_str(&config_str)?;
            Ok(config)
        } else {
            // Return default configuration
            Ok(AppConfig {
                watch_directory: "/etc/telemetry".to_string(),
                auto_remediate: false,
                log_level: "info".to_string(),
                baseline_store_path: "/var/lib/telemetry/baselines".to_string(),
            })
        }
    }
}
