/* main.rex - ARexx Compliance Verification Framework Entry Point */
parse arg BASELINE_FILE TARGET_STATE OUTPUT_DIR LOG_LEVEL

if BASELINE_FILE = '' | TARGET_STATE = '' | OUTPUT_DIR = '' then do
    say 'ERROR: Missing required arguments'
    say 'USAGE: exec main.rex BASELINE_FILE="policy.pcy" TARGET_STATE="state.dat" OUTPUT_DIR="reports" [LOG_LEVEL="INFO"]'
    exit 12
end

if LOG_LEVEL = '' then LOG_LEVEL = 'INFO'

call TRACE 'N'

/* Ensure output directory exists */
call SYSTEM 'mkdir -p' OUTPUT_DIR

/* Initialize global objects */
BASELINE_POLICY = .Hash~new
TARGET_CONTEXT = .Hash~new
COMPLIANCE_SCORE = 0
VERIFICATION_LOG = .List~new

/* Load Policy */
call .require('policy_loader.rex')
policy_load_status = load_policy(BASELINE_FILE)
if policy_load_status <> 'SUCCESS' then do
    say 'FATAL: Policy loading failed:' policy_load_status
    exit 1
end

/* Enumerate Target State */
call .require('state_enumerator.rex')
state_enum_status = enumerate_state(TARGET_STATE)
if state_enum_status <> 'SUCCESS' then do
    say 'FATAL: State enumeration failed:' state_enum_status
    exit 2
end

/* Run Compliance Check */
call .require('compliance_checker.rex')
check_result = run_compliance_check()

/* Generate Report */
call .require('reporter.rex')
report_status = generate_report(OUTPUT_DIR, check_result)

if report_status = 'SUCCESS' then do
    say 'VERIFICATION COMPLETE. SCORE:' COMPLIANCE_SCORE '%'
    exit 0
end else do
    say 'ERROR: Report generation failed:' report_status
    exit 3
end
