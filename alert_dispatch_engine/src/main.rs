use tokio::signal;
use anyhow::Result;
use tracing::{info, error};
use std::sync::Arc;

mod config;
mod engine;
mod dispatcher;
mod models;

use config::Config;
use engine::AlertEngine;
use dispatcher::NotificationDispatcher;

#[tokio::main]
async fn main() -> Result<()> {
    tracing_subscriber::fmt::init();
    
    info!("Initializing Alert Dispatch Engine...");
    
    let config = Config::load()?;
    let engine = Arc::new(AlertEngine::new(config.rules));
    let dispatcher = Arc::new(NotificationDispatcher::new(config.dispatchers));
    
    // Start metric ingestion listener
    let engine_handle = engine.clone();
    let dispatcher_handle = dispatcher.clone();
    
    tokio::spawn(async move {
        // Simulated metric ingestion loop
        loop {
            // In a real scenario, this would listen on a TCP/UDP socket or HTTP endpoint
            // For this implementation, we assume an external producer pushes to stdin or a mock source
            tokio::time::sleep(tokio::time::Duration::from_secs(1)).await;
            // engine_handle.evaluate_mock_metrics().await;
        }
    });
    
    info!("Engine started. Listening for metrics...");
    
    // Graceful shutdown handler
    signal::ctrl_c().await?;
    info!("Shutting down gracefully...");
    
    Ok(())
}
