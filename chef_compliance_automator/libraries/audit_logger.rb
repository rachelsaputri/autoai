# library[chef_compliance_automator::audit_logger]
#
# Provides structured, deterministic logging and state tracking.
# Ensures comprehensive audit registry with transaction-level detail.

class AuditLogger
  attr_reader :log_path, :strategy

  def initialize(log_path:, strategy: 'warn')
    @log_path = log_path
    @strategy = strategy
  end

  def log(level, message)
    timestamp = Time.now.utc.iso8601
    log_entry = "[#{timestamp}] [#{level}] #{message}"

    begin
      File.open(@log_path, 'a') do |f|
        f.puts(log_entry)
      end
    rescue => e
      Chef::Log.error("Failed to write to audit log: #{e.message}")
    end

    case level
    when 'INFO'
      Chef::Log.info(message)
    when 'WARN'
      Chef::Log.warn(message)
    when 'ERROR'
      Chef::Log.error(message)
    else
      Chef::Log.debug(message)
    end
  end
end
