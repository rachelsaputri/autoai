use crate::config::Config;
use crate::models::Alert;

pub struct ActionHandler;

impl ActionHandler {
    pub fn new() -> Self {
        ActionHandler
    }

    pub async fn execute(&self, alert: &Alert, config: &Config) -> Result<(), Box<dyn std::error::Error>> {
        // Safety interlock: Check if action is allowed
        if !self.is_action_allowed(alert, config) {
            return Ok(());
        }

        match alert.action_type.as_str() {
            "network_isolation" => self.isolate_network(alert, config).await,
            "process_termination" => self.terminate_process(alert, config).await,
            "session_revocation" => self.revoke_session(alert, config).await,
            _ => {
                tracing::warn!("Unknown action type: {}", alert.action_type);
                Ok(())
            }
        }
    }

    fn is_action_allowed(&self, alert: &Alert, config: &Config) -> bool {
        // Check if the action type is enabled in config
        config.actions.iter().any(|a| a.action_type == alert.action_type && a.enabled)
    }

    async fn isolate_network(&self, alert: &Alert, config: &Config) -> Result<(), Box<dyn std::error::Error>> {
        if config.dry_run {
            tracing::info!("[DRY RUN] Isolating network for alert: {}", alert.id);
            return Ok(());
        }
        // Use nix or system crate to call iptables or similar
        // nix::sys::socket::... or execute command
        tracing::info!("Executing network isolation for alert: {}", alert.id);
        Ok(())
    }

    async fn terminate_process(&self, alert: &Alert, config: &Config) -> Result<(), Box<dyn std::error::Error>> {
        if config.dry_run {
            tracing::info!("[DRY RUN] Terminating process for alert: {}", alert.id);
            return Ok(());
        }
        // Use nix::unistd::kill
        tracing::info!("Executing process termination for alert: {}", alert.id);
        Ok(())
    }

    async fn revoke_session(&self, alert: &Alert, config: &Config) -> Result<(), Box<dyn std::error::Error>> {
        if config.dry_run {
            tracing::info!("[DRY RUN] Revoking session for alert: {}", alert.id);
            return Ok(());
        }
        // Call API to revoke session
        tracing::info!("Executing session revocation for alert: {}", alert.id);
        Ok(())
    }
} 
