package com.security.coordinator.stream

import com.security.coordinator.model.SecurityEvent
import com.security.coordinator.model.Incident

// Represents the result of correlating a security event
final case class IncidentCorrelationResult(
  event: SecurityEvent,
  incidents: List[Incident]
)
