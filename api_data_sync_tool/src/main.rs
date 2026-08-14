mod sync;
mod config;
mod models;

use config::Config;
use sync::SyncEngine;
use log::info;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    env_logger::init();
    
    let config = Config::load()?;
    info!("Starting Data Sync Tool with config: {:?}", config);
    
    let engine = SyncEngine::new(config);
    engine.run().await?;
    
    Ok(())
}
