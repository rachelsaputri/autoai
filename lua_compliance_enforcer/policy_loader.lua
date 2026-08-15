-- policy_loader.lua: Handles loading and parsing of policy definitions

local M = {}

local function parse_json(path)
    local file = io.open(path, "r")
    if not file then
        return nil, "Failed to open file: " .. path
    end
    local content = file:read("*all")
    file:close()
    -- Simple JSON parser fallback if lpeg/luci is not available
    -- In production, use a proper JSON library like json.lua or cjson
    local status, result = pcall(function()
        return (loadstring("return " .. content))()
    end)
    if not status then
        return nil, "Failed to parse JSON in: " .. path
    end
    return result, nil
end

function M.load_all(dir)
    local policies = {}
    for fname in io.popen("ls " .. dir .. "/*.json 2>/dev/null"):lines() do
        local policy, err = parse_json(fname)
        if not policy then
            print("[PolicyLoader] Warning: " .. err)
        else
            table.insert(policies, policy)
        end
    end
    return policies
end

return M
