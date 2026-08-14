use super::parser::ParsedPacket;

pub struct AnomalyScorer;

impl AnomalyScorer {
    pub fn new() -> Self {
        Self
    }

    pub fn calculate_score(&self, parsed: &ParsedPacket, matched_rules: &[String]) -> f32 {
        let mut score: f32 = 0.0;

        // Base score from matched rules
        // In a real implementation, each rule would have a score
        // For now, we assume a fixed score per rule for demonstration
        let rule_score_base: f32 = 50.0;
        score += matched_rules.len() as f32 * rule_score_base;

        // Payload length anomaly
        if parsed.payload.len() > 1000 {
            score += 20.0;
        }

        // Unknown protocol penalty
        if parsed.protocol == "unknown_protocol" {
            score += 30.0;
        }

        // Normalize score to 0-100 range for simplicity in this example
        score = score.min(100.0);

        score
    }
}
