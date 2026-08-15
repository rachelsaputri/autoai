package com.security.coordinator

import akka.actor.{ActorRef, ActorSystem, Props}
import com.typesafe.config.ConfigFactory
import com.security.coordinator.stream.EventStreamProcessor
import com.security.coordinator.actor.IncidentManager
import com.security.coordinator.audit.AuditLogger

object CoordinatorApp {

  def main(args: Array[String]): Unit = {
    val config = ConfigFactory.load()
    implicit val system: ActorSystem = ActorSystem("CoordinatorSystem", config)

    // Initialize Audit Logger
    val auditLogger = system.actorOf(Props[AuditLogger], "AuditLogger")

    // Initialize Incident Manager
    val incidentManager = system.actorOf(IncidentManager.props(auditLogger), "IncidentManager")

    // Initialize Stream Processor
    val streamProcessor = system.actorOf(Props(new EventStreamProcessor(incidentManager)), "EventStreamProcessor")

    // Start the stream processor
    streamProcessor ! "START"

    println("Scala Federated Incident Coordinator started successfully.")
    println("To stop the system, use Ctrl+C or send a shutdown signal.")
  }
}
