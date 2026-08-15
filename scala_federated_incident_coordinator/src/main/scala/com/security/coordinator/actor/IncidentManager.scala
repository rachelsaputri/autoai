package com.security.coordinator.actor

import akka.actor.{Actor, ActorRef, Props}
import com.security.coordinator.model.Incident
import com.security.coordinator.stream.IncidentCorrelationResult
import com.security.coordinator.enforcement.EnforcementEngine
import com.security.coordinator.audit.AuditEvent
import scala.collection.mutable
import scala.concurrent.ExecutionContext

/**
 * IncidentManager is responsible for managing the lifecycle of security incidents.
 * It receives correlated incidents, enriches them, assigns them, and triggers enforcement actions.
 */
class IncidentManager(auditLogger: ActorRef) extends Actor {
  implicit val ec: ExecutionContext = context.dispatcher

  private val enforcementEngine = new EnforcementEngine(auditLogger)
  private val incidents: mutable.Map[String, Incident] = mutable.Map.empty

  def receive: Receive = {
    case IncidentCorrelationResult(event, incidentsToManage) =>
      if (incidentsToManage.nonEmpty) {
        auditLogger ! AuditEvent("EventCorrelated", s"Event ${event.id} correlated with ${incidentsToManage.length} incidents")

        incidentsToManage.foreach { incident =>
          // Enrich the incident
          val enrichedIncident = enrichIncident(incident, event)
          // Save or update the incident
          incidents.put(incident.id, enrichedIncident)
          // Trigger enforcement actions
          enforcementEngine.processIncident(incident.id)
        }
      }

    case "GET_INCIDENTS" =>
      sender() ! incidents.values.toList

    case "GET_INCIDENT"(id) =>
      sender() ! incidents.get(id)
  }

  private def enrichIncident(incident: Incident, event: com.security.coordinator.model.SecurityEvent): Incident = {
    // Example enrichment logic
    val enrichedSource = s"${incident.source}+${event.source}"
    incident.copy(source = enrichedSource, severity = calculateSeverity(incident, event))
  }

  private def calculateSeverity(incident: Incident, event: com.security.coordinator.model.SecurityEvent): String = {
    // Example severity calculation
    if (event.type == "critical") "critical"
    else if (event.type == "suspicious-activity") "medium"
    else "low"
  }
}

object IncidentManager {
  def props(auditLogger: ActorRef): Props = Props(new IncidentManager(auditLogger))
}
