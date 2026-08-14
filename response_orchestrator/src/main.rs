use tokio;
use config::Config;
use engine::ResponseEngine;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    tracing_subscriber::fmt::init();
    
    let config = Config::load()?;
    let mut engine = ResponseEngine::new(config);
    
    tracing::info!("Response Orchestrator initialized");
    
    // Block forever, processing events from the IPC channel
    engine.run().await?;
    
    Ok(())
}
