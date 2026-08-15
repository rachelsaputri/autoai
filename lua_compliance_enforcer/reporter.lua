-- reporter.lua: Formats and outputs compliance check results

local M = {}

function M.generate(results)
    local report = { metadata = { generated_at = os.date(), tool = "lua_compliance_enforcer" }, results = {} }
    for _, r in ipairs(results) do
        table.insert(report.results, r)
    end

    -- Simple JSON serialization for the report
    local json_str = "{\"metadata\": {\"generated_at\": \"" .. report.metadata.generated_at .. "\", \"tool\": \"" .. report.metadata.tool .. "\"}, \"results\": ["
    for i, res in ipairs(report.results) do
        json_str = json_str .. "{\"policy_id\": \"" .. res.policy_id .. "\", \"status\": \"" .. res.status .. "\", \"details\": \"" .. res.details .. "\", \"timestamp\": \"" .. res.timestamp .. "\"}"
        if i < #report.results then json_str = json_str .. ", " end
    end
    json_str = json_str .. "]}"

    -- Write to file
    local file = io.open("compliance_report.json", "w")
    if file then
        file:write(json_str)
        file:close()
        return "compliance_report.json"
    else
        return "failed"
    end
end

return M
