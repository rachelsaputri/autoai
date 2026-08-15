mod engine;
mod models;
mod patterns;
mod config;

use engine::DriftEngine;
use config::AppConfig;
use log::info;

#[tokio::main]
async fn main() {
    env_logger::init();
    
    let config = AppConfig::load().expect("Failed to load configuration");
    let mut engine = DriftEngine::new(config);
    
    info!("Drift Audit Engine started");
    
    if let Err(e) = engine.run().await {
        eprintln!("Engine error: {}", e);
        std::process::exit(1);
    }
}
