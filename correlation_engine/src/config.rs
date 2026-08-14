use serde::Deserialize;
use std::path::Path;

#[derive(Debug, Deserialize)]
pub struct Config {
    pub ingestion_interval_ms: u64,
    pub window_size_secs: u64,
    pub anomaly_threshold: f64,
    pub max_memory_mb: u64,
    pub regex_optimization_level: u32,
    pub pattern_files: Vec<String>,
}

impl Config {
    pub fn from_path<P: AsRef<Path>>(path: P) -> Result<Self, Box<dyn std::error::Error>> {
        let content = std::fs::read_to_string(path)?;
        let config: Config = toml::from_str(&content)?;
        Ok(config)
    }
}

pub fn load_config() -> Result<Config, Box<dyn std::error::Error + Send + Sync>> {
    // Default config for demonstration
    Ok(Config {
        ingestion_interval_ms: 100,
        window_size_secs: 60,
        anomaly_threshold: 0.85,
        max_memory_mb: 512,
        regex_optimization_level: 3,
        pattern_files: vec!["patterns.toml".to_string()],
    })
}
