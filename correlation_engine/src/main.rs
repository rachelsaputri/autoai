use tokio::time::{interval, Duration};
use std::sync::Arc;
use std::error::Error;
use log::{info, error};

mod config;
mod engine;
mod patterns;
mod scorer;
mod models;

use engine::CorrelationEngine;

#[tokio::main]
async fn main() -> Result<(), Box<dyn Error + Send + Sync>> {
    env_logger::init();
    
    let cfg = config::load_config()?;
    info!("Initializing Correlation Engine v{}", env!("CARGO_PKG_VERSION"));
    
    let mut engine = CorrelationEngine::new(cfg);
    
    // Simulate ingestion from log_metrics_dashboard and alert_dispatch_engine
    let mut interval = interval(Duration::from_secs(1));
    
    loop {
        interval.tick().await;
        
        match engine.process_batch().await {
            Ok(stats) => {
                info!("Processed batch. New anomalies: {}", stats.new_anomalies);
                if stats.new_anomalies > 0 {
                    // Trigger dispatch to alert_engine
                    info!("Dispatching anomalies to alert_dispatch_engine...");
                }
            }
            Err(e) => {
                error!("Batch processing error: {}", e);
            }
        }
    }
}
