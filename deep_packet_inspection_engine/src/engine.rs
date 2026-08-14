use super::parser::PacketParser;
use super::rules::RuleSet;
use super::scorer::AnomalyScorer;
use crate::config::Config;
use tokio::sync::mpsc;
use std::sync::Arc;

#[derive(Debug)]
pub struct DPIEngine {
    config: Config,
    parser: PacketParser,
    rules: Arc<RuleSet>,
    scorer: Arc<AnomalyScorer>,
    tx: mpsc::Sender<AnalysisResult>,
}

#[derive(Debug)]
pub struct AnalysisResult {
    pub packet_id: u64,
    pub anomaly_score: f32,
    pub matched_rules: Vec<String>,
    pub payload_excerpt: Vec<u8>,
}

impl DPIEngine {
    pub async fn new(config: Config) -> Result<Self, Box<dyn std::error::Error>> {
        println!("Initializing parser...");
        let parser = PacketParser::new();

        println!("Loading rule set from {:?}...", config.rules_path);
        let rules = RuleSet::load(&config.rules_path).await?;
        let rules = Arc::new(rules);

        println!("Initializing anomaly scorer...");
        let scorer = Arc::new(AnomalyScorer::new());

        let (tx, _rx) = mpsc::channel(1000);

        Ok(Self {
            config,
            parser,
            rules,
            scorer,
            tx,
        })
    }

    pub async fn run(&self) -> Result<(), Box<dyn std::error::Error>> {
        println!("DPI Engine started.");
        // In a real implementation, this would listen for incoming packets
        // and process them in a loop.
        // For now, we'll simulate a single analysis cycle.
        self.simulate_analysis_cycle().await?;
        Ok(())
    }

    async fn simulate_analysis_cycle(&self) -> Result<(), Box<dyn std::error::Error>> {
        // Simulate receiving a packet
        let sample_packet = b"\\x00\\x01\\x41\\x4d\\x41\\x52\\x5f\\x53\\x49\\x47\\x4e\\x41\\x54\\x55\\x52\\x45\\x00";

        println!("Analyzing sample packet...");
        let result = self.analyze_packet(sample_packet.to_vec(), 1).await?;

        println!("Analysis Result: {:?}", result);

        // Send result to downstream services via RPC
        // self.tx.send(result).await?;

        Ok(())
    }

    async fn analyze_packet(&self, packet: Vec<u8>, id: u64) -> Result<AnalysisResult, Box<dyn std::error::Error>> {
        // Parse the packet
        let parsed = self.parser.parse(&packet)?;

        // Apply rules
        let matched_rules = self.rules.evaluate(&parsed)?;

        // Calculate anomaly score
        let score = self.scorer.calculate_score(&parsed, &matched_rules);

        let payload_excerpt = if parsed.payload.len() > 20 {
            parsed.payload[..20].to_vec()
        } else {
            parsed.payload.clone()
        };

        Ok(AnalysisResult {
            packet_id: id,
            anomaly_score: score,
            matched_rules,
            payload_excerpt,
        })
    }
}
