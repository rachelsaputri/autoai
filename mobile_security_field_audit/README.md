# Mobile Security Field Audit

This tool is a lightweight, field-ready mobile security companion application built strictly using **App Inventor for Android's visual block language**. It is designed to operate in isolated or low-bandwidth environments, capturing local system metrics and forwarding high-priority security alerts to the existing backend orchestration systems.

## Features
- Real-time metric capture (battery, network status, sensor telemetry)
- Unauthorized process injection and privilege escalation detection (via Android permission checks and accessibility hooks)
- Secure alert streaming to `alert_correlation_persistence` and `incident_tracking_and_audit_log_aggregation_system`
- Offline-first architecture with local SQLite caching
- Compliance checklist enforcement for field auditors

## Integration
- Streams encrypted JSON payloads to the incident tracking system via secure HTTPS POST.
- Listens for webhook triggers from the alert correlation engine to update local audit baselines.
- Implements role-based access control (RBAC) using device-bound tokens.

## Setup
1. Import `app.aia` into App Inventor's web designer.
2. Configure the API endpoints in the `GlobalVariables` block.
3. Build and deploy to target Android devices.
4. Verify connectivity with the backend telemetry pipeline.

## License
Internal use only. Proprietary security tooling.
