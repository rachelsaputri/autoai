use tokio;
use std::sync::Arc;

mod engine;
mod parser;
mod rules;
mod scorer;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    println!("Starting Deep Packet Inspection Engine...");

    // Initialize configuration
    let config = config::load_config()?;

    // Initialize the DPI engine
    let dpi_engine = engine::DPIEngine::new(config).await?;

    println!("DPI Engine initialized. Listening for traffic...");

    // Start the main engine loop (simulated for now)
    dpi_engine.run().await?;

    Ok(())
}

#[allow(dead_code)]
mod config {
    use serde::{Deserialize, Serialize};
    use std::path::PathBuf;

    #[derive(Debug, Deserialize, Serialize)]
    pub struct Config {
        pub listen_address: String,
        pub rules_path: PathBuf,
        pub log_level: String,
    }

    pub fn load_config() -> Result<Config, Box<dyn std::error::Error>> {
        // Load from default path or env var
        let config_path = std::env::var("DPI_CONFIG_PATH")
            .unwrap_or_else(|_| "config.yaml".to_string());
        let content = std::fs::read_to_string(&config_path)
            .map_err(|e| format!("Failed to read config: {}", e))?;
        let config: Config = serde_yaml::from_str(&content)
            .map_err(|e| format!("Failed to parse config: {}", e))?;
        Ok(config)
    }
}
