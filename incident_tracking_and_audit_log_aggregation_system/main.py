import sys
import os
from tracetk import TicketManager, AuditLogger
from tracetk.config import ConfigLoader

def main():
    config = ConfigLoader.load('config.ini')
    manager = TicketManager(config)
    logger = AuditLogger(config)
    
    if not manager.start_ingestion():
        print("Failed to start ingestion service.")
        sys.exit(1)
        
    print("Incident Tracking and Audit Log Aggregation System is running.")
    try:
        while True:
            alerts = manager.fetch_normalized_alerts()
            for alert in alerts:
                ticket_id = manager.generate_ticket(alert)
                logger.log_audit_event(ticket_id, alert)
                manager.link_related_tickets(ticket_id, alert)
                print(f"Processed ticket: {ticket_id}")
    except KeyboardInterrupt:
        print("Shutting down system.")
        manager.stop_ingestion()
        sys.exit(0)

if __name__ == '__main__':
    main()
