package com.security.coordinator.enforcement

import akka.actor.ActorRef
import com.security.coordinator.audit.AuditEvent
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

/**
 * EnforcementEngine is responsible for executing predefined enforcement actions
 * based on incident severity and policy.
 */
class EnforcementEngine(auditLogger: ActorRef) {

  // Plugin system for enforcement actions
  private var plugins: List[EnforcementPlugin] = List.empty

  def registerPlugin(plugin: EnforcementPlugin): Unit = {
    plugins = plugin :: plugins
  }

  /**
   * Processes an incident and triggers appropriate enforcement actions.
   */
  def processIncident(incidentId: String): Future[Unit] = {
    val actions = Future.sequence(plugins.map(_.execute(incidentId)))
    actions.map { results =>
      auditLogger ! AuditEvent("EnforcementActionsExecuted", s"Actions for incident $incidentId: $results")
    }
  }
}

// Trait for enforcement plugins
trait EnforcementPlugin {
  def execute(incidentId: String): Future[String]
}
