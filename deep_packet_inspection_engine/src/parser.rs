use std::collections::HashMap;
use crate::engine::AnalysisResult;

#[derive(Debug, Clone)]
pub struct ParsedPacket {
    pub header: HashMap<String, Vec<u8>>,
    pub payload: Vec<u8>,
    pub protocol: String,
}

pub struct PacketParser;

impl PacketParser {
    pub fn new() -> Self {
        Self
    }

    pub fn parse(&self, data: &[u8]) -> Result<ParsedPacket, Box<dyn std::error::Error>> {
        if data.len() < 4 {
            return Err("Packet too short".into());
        }

        let mut parsed = ParsedPacket {
            header: HashMap::new(),
            payload: Vec::new(),
            protocol: String::from("unknown"),
        };

        // Simple header parsing: first 2 bytes are version, next 2 are type
        let version = u16::from_be_bytes([data[0], data[1]]);
        let ptype = u16::from_be_bytes([data[2], data[3]]);

        parsed.header.insert("version".to_string(), vec![version as u8]);
        parsed.header.insert("type".to_string(), vec![ptype as u8]);

        // Assume everything after 4 bytes is payload
        if data.len() > 4 {
            parsed.payload = data[4..].to_vec();
        }

        // Identify protocol based on type
        match ptype {
            0x41 => parsed.protocol = String::from("custom_binary_v1"),
            0x42 => parsed.protocol = String::from("custom_binary_v2"),
            _ => parsed.protocol = String::from("unknown_protocol"),
        }

        Ok(parsed)
    }
}
