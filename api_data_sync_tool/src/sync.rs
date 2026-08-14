use reqwest::Client;
use crate::config::Config;
use crate::models::AnomalyData;
use log::{info, error};

pub struct SyncEngine {
    config: Config,
    client: Client,
}

impl SyncEngine {
    pub fn new(config: Config) -> Self {
        SyncEngine {
            config,
            client: Client::builder()
                .timeout(std::time::Duration::from_secs(config.timeout_secs))
                .build()
                .expect("Failed to build HTTP client"),
        }
    }

    pub async fn run(&self) -> Result<(), Box<dyn std::error::Error>> {
        info!("Polling anomaly detector at: {}", self.config.anomaly_url);
        
        loop {
            match self.fetch_and_send().await {
                Ok(_) => {
                    info!("Sync cycle completed successfully.");
                }
                Err(e) => {
                    error!("Sync cycle failed: {:?}", e);
                }
            }
            tokio::time::sleep(std::time::Duration::from_secs(self.config.poll_interval_secs)).await;
        }
    }

    async fn fetch_and_send(&self) -> Result<(), Box<dyn std::error::Error>> {
        let anomalies: Vec<AnomalyData> = self.client
            .get(&self.config.anomaly_url)
            .send()
            .await?
            .json()
            .await?;

        for anomaly in anomalies {
            let response = self.client
                .post(&self.config.orchestrator_url)
                .json(&anomaly)
                .send()
                .await?;
            
            info!("Sent anomaly {} to orchestrator: {}", anomaly.id, response.status());
        }

        Ok(())
    }
}
