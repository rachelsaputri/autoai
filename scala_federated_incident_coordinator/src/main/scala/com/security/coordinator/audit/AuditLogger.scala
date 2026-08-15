package com.security.coordinator.audit

import akka.actor.Actor
import akka.event.Logging
import scala.io.Source
import scala.util.{Try, Success, Failure}
import java.nio.file.{Files, Paths, StandardOpenOption}
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter

/**
 * AuditLogger is responsible for logging all system activities and state changes
 * to ensure a complete and tamper-evident audit trail.
 */
class AuditLogger extends Actor {
  private val logger = Logging(context.system, this)
  private val logFilePath = "audit.log"
  private val formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")

  def receive: Receive = {
    case AuditEvent(eventType, message) =>
      val timestamp = LocalDateTime.now().format(formatter)
      val logEntry = s"[$timestamp] $eventType: $message"

      // Log to console
      logger.info(logEntry)

      // Append to file
      tryAppendToFile(logFilePath, logEntry)

    case _ =>
      logger.warning("Received unknown message in AuditLogger")
  }

  private def tryAppendToFile(filePath: String, entry: String): Unit = {
    val path = Paths.get(filePath)
    val openOptions = Set(StandardOpenOption.CREATE, StandardOpenOption.APPEND)
    Try(Files.write(path, (entry + "\n").getBytes, openOptions: _*)).recoverWith {
      case e =>
        logger.warning(s"Failed to write to audit log: ${e.getMessage}")
        scala.util.Failure(e)
    }
  }
}

// Audit event case class
final case class AuditEvent(eventType: String, message: String)
