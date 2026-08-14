use serde::Deserialize;
use std::fs;

#[derive(Debug, Deserialize)]
pub struct Config {
    pub port: u16,
    pub window_size: usize,
    pub z_score_threshold: f64,
    pub entropy_threshold: f64,
    pub data_store_url: String,
}

impl Config {
    pub fn load() -> Result<Self, Box<dyn std::error::Error>> {
        let config_str = fs::read_to_string("config.json")
            .expect("Failed to read config.json");
        let config: Config = serde_json::from_str(&config_str)
            .expect("Failed to parse config.json");
        Ok(config)
    }
}
