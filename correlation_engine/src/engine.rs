use crate::config::Config;
use crate::models::{LogEvent, PatternMatch, Anomaly, BatchResult};
use crate::patterns::PatternRegistry;
use crate::scorer::AnomalyScorer;
use rayon::prelude::*;
use tokio::sync::Mutex;
use std::sync::Arc;
use std::error::Error;
use log::{info, warn};
use std::collections::HashMap;

pub struct CorrelationEngine {
    config: Config,
    patterns: Arc<PatternRegistry>,
    scorer: Arc<Mutex<AnomalyScorer>>,
    event_buffer: Vec<LogEvent>,
    pattern_matches: Vec<PatternMatch>,
}

impl CorrelationEngine {
    pub fn new(config: Config) -> Self {
        CorrelationEngine {
            config,
            patterns: Arc::new(PatternRegistry::new()),
            scorer: Arc::new(Mutex::new(AnomalyScorer::new())),
            event_buffer: Vec::new(),
            pattern_matches: Vec::new(),
        }
    }

    pub async fn ingest_events(&mut self, events: Vec<LogEvent>) {
        self.event_buffer.extend(events);
        info!("Ingested {} events into buffer", self.event_buffer.len());
    }

    pub async fn process_batch(&mut self) -> Result<BatchResult, Box<dyn Error>> {
        if self.event_buffer.is_empty() {
            return Ok(BatchResult {
                events_processed: 0,
                patterns_matched: 0,
                new_anomalies: 0,
            });
        }

        let mut patterns_clone = self.patterns.clone();
        let buffer = std::mem::take(&mut self.event_buffer);
        
        // Parallel matching
        let matches: Vec<PatternMatch> = buffer.par_iter()
            .filter_map(|event| {
                let m = patterns_clone.matches(&event.message);
                m.into_iter()
                    .map(|(name, score)| PatternMatch {
                        pattern_id: name,
                        event_id: event.id.clone(),
                        score,
                        matched_text: event.message.clone(),
                        timestamp: event.timestamp,
                    })
                    .collect()
            })
            .collect();
        
        let mut result = BatchResult {
            events_processed: buffer.len(),
            patterns_matched: matches.len(),
            new_anomalies: 0,
        };
        
        let mut scorer = self.scorer.lock().await;
        
        // Group by pattern and event cluster for anomaly generation
        let mut clusters: HashMap<String, Vec<(&str, f64)>> = HashMap::new();
        for m in &matches {
            clusters.entry(m.pattern_id.clone())
                .or_insert_with(Vec::new)
                .push((&m.event_id, m.score));
        }

        for (pattern_name, event_scores) in clusters {
            let mut event_ids = Vec::new();
            let mut base_score = 0.0;
            
            for (eid, sc) in event_scores {
                event_ids.push(eid.to_string());
                base_score = (base_score + sc) / 2.0; // Simple average for demo
            }
            
            if event_ids.len() >= 2 {
                // Correlation detected: multiple events match same pattern
                let final_score = scorer.score_event(&pattern_name, base_score);
                let anomaly = scorer.generate_anomaly(&pattern_name, final_score, event_ids, HashMap::new());
                info!("Anomaly detected: {:?} Score: {:.2}", anomaly.type_, anomaly.confidence);
                result.new_anomalies += 1;
                
                // In real scenario, this would trigger the alert_dispatch_engine
                self.dispatch_alert(&anomaly).await;
            }
        }
        
        Ok(result)
    }

    async fn dispatch_alert(&self, anomaly: &crate::models::Anomaly) {
        // Placeholder for network dispatch to alert_dispatch_engine
        // In production, use reqwest or tonic gRPC
        info!("Dispatching alert: {:?}", anomaly);
    }
}
