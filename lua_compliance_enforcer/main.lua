-- main.lua: Entry point for the Lua Compliance Enforcer

local policy_loader = require("policy_loader")
local system_checker = require("system_checker")
local enforcement_engine = require("enforcement_engine")
local reporter = require("reporter")

local function main()
    print("[Compliance Enforcer] Starting system compliance check...")

    -- Load policies from the policies/ directory
    local policies = policy_loader.load_all("policies")
    if not policies or #policies == 0 then
        print("[Compliance Enforcer] No policies loaded. Exiting.")
        return
    end
    print("[Compliance Enforcer] Loaded " .. #policies .. " policy definitions.")

    -- Check system state against policies
    local results = {}
    for _, policy in ipairs(policies) do
        print("[Compliance Enforcer] Evaluating policy: " .. policy.policy_id)
        local status, details = system_checker.check(policy)
        local result = {
            policy_id = policy.policy_id,
            status = status, -- 'compliant', 'non_compliant', 'error'
            details = details,
            timestamp = os.date("%Y-%m-%d %H:%M:%S")
        }
        table.insert(results, result)

        -- Enforce policy if non-compliant
        if status == "non_compliant" then
            enforcement_engine.trigger(policy, result)
        end
    end

    -- Generate report
    local report_path = reporter.generate(results)
    print("[Compliance Enforcer] Compliance check complete. Report generated at: " .. report_path)
end

main()
