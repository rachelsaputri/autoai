use ndarray::Array1;
use std::collections::HashMap;

use crate::config::Config;
use crate::models::CorrelatedAlert;

pub struct StatisticalEngine {
    config: Config,
    historical_baseline: HashMap<String, Vec<f64>>,
}

impl StatisticalEngine {
    pub fn new(config: &Config) -> Self {
        StatisticalEngine {
            config: config.clone(),
            historical_baseline: HashMap::new(),
        }
    }

    pub fn analyze(&mut self, event: &CorrelatedAlert) -> Result<(f64, String), Box<dyn std::error::Error>> {
        // 1. Extract features from the alert
        let features = self.extract_features(event);
        
        // 2. Compare against baseline
        if let Some(baseline) = self.historical_baseline.get("global") {
            // Calculate Z-Score
            let z = self.calculate_z_score(&features, baseline);
            if z > self.config.z_score_threshold {
                return Ok((z, "statistical_deviation".to_string()));
            }
        }
        
        // 3. Calculate Entropy (e.g., port entropy or protocol diversity)
        // Assuming event.metadata has relevant fields for entropy calculation
        // Simplified for this implementation
        Ok((0.0, "normal".to_string()))
    }

    fn extract_features(&self, event: &CorrelatedAlert) -> Vec<f64> {
        let severity = event.severity as f64;
        let ts = event.timestamp as f64;
        vec![severity, ts]
    }

    fn calculate_z_score(&self, data: &[f64], baseline: &[f64]) -> f64 {
        let x = Array1::from_vec(data.to_vec());
        let mu = Array1::from_vec(baseline.to_vec());
        
        // Naive mean and std calc for demonstration
        let mean = mu.mean();
        let var = mu.var(0.0);
        let std = var.sqrt();
        
        if std == 0.0 {
            return 0.0;
        }
        
        // Simplified Z-score for the first feature (severity)
        let diff = x[0] - mean;
        diff / std
    }

    pub fn update_baseline(&mut self, event: &CorrelatedAlert) {
        // In a real scenario, this would accumulate data over time
        // and update the baseline statistics
        let features = self.extract_features(event);
        
        self.historical_baseline
            .entry("global".to_string())
            .or_insert_with(Vec::new)
            .extend_from_slice(&features);
    }
}
