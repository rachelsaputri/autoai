package com.security.coordinator.model

// Immutable model representing a security incident
final case class Incident(
  id: String,
  source: String,
  severity: String,
  status: String = "New",
  correlationId: Option[String] = None,
  createdAt: Long = System.currentTimeMillis()
)
