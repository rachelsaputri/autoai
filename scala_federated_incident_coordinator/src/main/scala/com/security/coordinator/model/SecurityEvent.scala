package com.security.coordinator.model

// Immutable model representing a security event
final case class SecurityEvent(
  id: String,
  source: String,
  `type`: String,
  timestamp: Long = System.currentTimeMillis(),
  details: Map[String, String] = Map.empty
)
