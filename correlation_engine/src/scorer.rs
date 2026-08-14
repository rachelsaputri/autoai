use crate::models::Anomaly;
use std::collections::HashMap;
use std::time::{SystemTime, Duration};

pub struct AnomalyScorer {
    history: HashMap<String, Vec<f64>>,
}

impl AnomalyScorer {
    pub fn new() -> Self {
        AnomalyScorer {
            history: HashMap::new(),
        }
    }

    pub fn score_event(&mut self, event_id: &str, base_score: f64) -> f64 {
        self.history.entry(event_id.to_string())
            .or_insert_with(Vec::new)
            .push(base_score);
            
        let scores = self.history.get(event_id).unwrap();
        let avg = scores.iter().sum::<f64>() / scores.len() as f64;
        let max = scores.iter().cloned().fold(0.0f64, f64::max);
        
        // Weighted combination of average and peak to detect both sustained and spike attacks
        avg * 0.6 + max * 0.4
    }

    pub fn generate_anomaly(&self, pattern_name: &str, score: f64, event_ids: Vec<String>, context: HashMap<String, String>) -> Anomaly {
        let severity = match score {
            s if s > 0.9 => "critical",
            s if s > 0.7 => "high",
            s if s > 0.5 => "medium",
            _ => "low",
        };

        Anomaly {
            anomaly_id: format!("ANM-{}", event_ids.first().map_or("0000", |id| id.as_str())),
            type_: pattern_name.to_string(),
            severity: severity.to_string(),
            confidence: score,
            related_events: event_ids,
            root_cause_hypothesis: format!("Detected {} pattern with score {:.2}", pattern_name, score),
            created_at: SystemTime::now(),
            context,
        }
    }

    pub fn clean_history(&mut self, max_age_secs: u64) {
        let now = SystemTime::now();
        let max_age = Duration::from_secs(max_age_secs);
        
        // In a real impl, events would have timestamps. 
        // Here we simulate cleanup of low-confidence history to save memory
        self.history.retain(|_, scores| {
            !scores.is_empty() // Simplified cleanup logic
        });
    }
}
