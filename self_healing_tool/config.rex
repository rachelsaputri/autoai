#!/usr/bin/env rex

# Configuration for Self-Healing Tool
# Language: REX

# Default configuration values
function default_config()
  return {
    monitor_interval: 5,    # Seconds between monitoring cycles
    log_file: "system.log", # Path to system log file
    max_retries: 3,         # Maximum number of recovery attempts
    alert_email: "admin@example.com" # Email for alerts
  }
end function

# Load configuration from arguments or defaults
function load_config(args)
  local config = default_config()
  
  # Parse command-line arguments
  for each arg in args do
    if arg.starts_with("-c") then
      config.config_file = arg.after("-c")
      # Additional loading logic can be added here
    end if
    if arg.starts_with("-d") then
      config.log_file = arg.after("-d")
    end if
  end for
  
  return config
end function

# Save configuration to file
function save_config(config, filepath)
  local file = open(filepath, "write")
  if file == null then
    log_error("Failed to open file for writing: " + filepath)
    return false
  end if
  
  file.write("monitor_interval: " + config.monitor_interval)
  file.write("log_file: " + config.log_file)
  file.write("max_retries: " + config.max_retries)
  file.write("alert_email: " + config.alert_email)
  
  file.close()
  return true
end function

# Log error function (for use in config loading)
function log_error(message)
  print("[ERROR] " + message)
end function
