-- enforcement_engine.lua: Handles corrective actions for non-compliant policies

local M = {}

function M.trigger(policy, result)
    local enforcement = policy.enforcement
    if not enforcement then
        print("[Enforcement] No enforcement action defined for " .. policy.policy_id)
        return
    end

    if enforcement.type == "alert" then
        M.generate_alert(enforcement, result)
    elseif enforcement.type == "execute_script" then
        M.execute_script(enforcement.script_path)
    else
        print("[Enforcement] Unsupported enforcement type: " .. enforcement.type)
    end
end

function M.generate_alert(enforcement, result)
    -- Format alert for external consumption (e.g., syslog, API, or file)
    local alert_msg = "ALERT [" .. os.date() .. "]: Compliance violation detected. " ..
                      "Policy: " .. result.policy_id .. ". " ..
                      "Details: " .. result.details
    print(alert_msg)
    -- Optionally write to a file or send via HTTP
    -- io.open("alerts.log", "a"):write(alert_msg .. "\n"):close()
end

function M.execute_script(script_path)
    local status = os.execute(script_path)
    if status ~= 0 then
        print("[Enforcement] Failed to execute remediation script: " .. script_path)
    else
        print("[Enforcement] Remediation script executed successfully: " .. script_path)
    end
end

return M
