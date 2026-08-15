package com.security.coordinator.correlation

import com.security.coordinator.model.SecurityEvent
import com.security.coordinator.model.Incident
import java.util.UUID

/**
 * IncidentCorrelator is responsible for correlating security events and generating incidents.
 */
class IncidentCorrelator {

  /**
   * Correlates a security event and generates a list of relevant incidents.
   */
  def correlate(event: SecurityEvent): List[Incident] = {
    // Example correlation logic
    val incident = Incident(
      id = UUID.randomUUID().toString,
      source = event.source,
      severity = event.`type`,
      status = "New",
      correlationId = Some(event.id),
      createdAt = event.timestamp
    )
    List(incident)
  }
}
