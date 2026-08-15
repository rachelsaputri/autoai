package com.security.coordinator.stream

import akka.actor.{Actor, ActorRef, Props}
import akka.stream.scaladsl.Source
import akka.stream.{ActorMaterializer, Materializer}
import com.security.coordinator.model.SecurityEvent
import com.security.coordinator.correlation.IncidentCorrelator
import com.security.coordinator.actor.IncidentManager
import scala.concurrent.ExecutionContextExecutor

/**
 * EventStreamProcessor handles the ingestion and initial processing of security events.
 * It uses Akka Streams for high-throughput processing.
 */
class EventStreamProcessor(incidentManager: ActorRef) extends Actor {
  implicit val mat: Materializer = ActorMaterializer()
  implicit val ec: ExecutionContextExecutor = context.dispatcher

  private val correlator = new IncidentCorrelator()

  def receive: Receive = {
    case "START" =>
      // Example: Ingest events from a simulated source
      // In a real scenario, this could be from Kafka, AWS Kinesis, etc.
      val eventSource: Source[SecurityEvent, _] = Source(1 to 100).map(i => SecurityEvent(s"event-$i", s"source-$i", "suspicious-activity"))

      eventSource
        .mapAsync(4) { event =>
          // Process and correlate the event
          val correlatedIncidents = correlator.correlate(event)
          // Send correlated incidents to the Incident Manager
          incidentManager ! IncidentCorrelationResult(event, correlatedIncidents)
          Future.successful(())
        }
        .runForeach { _ =>
          // Handle any post-processing or logging
        }

    case e: SecurityEvent =>
      val correlatedIncidents = correlator.correlate(e)
      incidentManager ! IncidentCorrelationResult(e, correlatedIncidents)
  }
}

object EventStreamProcessor {
  def props(incidentManager: ActorRef): Props = Props(new EventStreamProcessor(incidentManager))
}

// Import necessary types for Future
import scala.concurrent.Future
