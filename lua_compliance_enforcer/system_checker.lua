-- system_checker.lua: Interfaces with the OS to verify configurations

local M = {}

function M.check(policy)
    local check_type = policy.check.type
    if check_type == "file_content" then
        return M.check_file_content(policy)
    elseif check_type == "process_running" then
        return M.check_process(policy)
    else
        return "error", "Unsupported check type: " .. check_type
    end
end

function M.check_file_content(policy)
    local path = policy.check.path
    local pattern = policy.check.pattern
    local file = io.open(path, "r")
    if not file then
        return "error", "File not found: " .. path
    end
    local content = file:read("*all")
    file:close()
    if string.find(content, pattern) then
        return "compliant", "Pattern found in " .. path
    else
        return "non_compliant", "Pattern not found in " .. path
    end
end

function M.check_process(policy)
    local process_name = policy.check.name
    local cmd = "pgrep -f " .. process_name .. " >/dev/null 2>&1"
    local exit_code = os.execute(cmd)
    if exit_code == 0 then
        return "compliant", "Process " .. process_name .. " is running"
    else
        return "non_compliant", "Process " .. process_name .. " is not running"
    end
end

return M
