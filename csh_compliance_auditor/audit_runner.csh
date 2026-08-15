#!/bin/csh -f
# =================================================================
# audit_runner.csh - Main Entry Point for Compliance Auditor
# =================================================================
# This script orchestrates the compliance audit workflow.
# It parses CLI arguments, loads policy configurations, runs checks,
# logs results, and generates the final compliance report.
# =================================================================

setenv AUDIT_MODE ""
setenv CONFIG_FILE ""
setenv ENABLE_REMEDIATION "FALSE"
setenv OUTPUT_DIR "./logs"
setenv LOG_FILE "./logs/compliance_report.log"
setenv REPORT_FILE "./logs/compliance_report.json"

# --- Argument Parsing ---
set ARGC = $#argv
set I = 1
while ( $I <= $ARGC )
    if ( "$argv[$I]" == "--mode" ) then
        @ I++
        set AUDIT_MODE = "$argv[$I]"
    else if ( "$argv[$I]" == "--config" ) then
        @ I++
        set CONFIG_FILE = "$argv[$I]"
    else if ( "$argv[$I]" == "--enable-remediation" ) then
        set ENABLE_REMEDIATION = "TRUE"
    else if ( "$argv[$I]" == "--output-dir" ) then
        @ I++
        set OUTPUT_DIR = "$argv[$I]"
    endif
    @ I++
end

# --- Validation ---
if ( ! $?AUDIT_MODE ) then
    echo "ERROR: Audit mode is required. Use --mode [full|quick|compliance-only]."
    exit 1
endif

if ( ! -f "${CONFIG_FILE}" ) then
    echo "ERROR: Configuration file not found: ${CONFIG_FILE}"
    exit 1
endif

# --- Initialization ---
if ( ! -d "${OUTPUT_DIR}" ) then
    mkdir -p ${OUTPUT_DIR}
    echo "Initialized output directory: ${OUTPUT_DIR}"
endif

echo "============================================================"
echo "C Shell Compliance Auditor - Starting"
echo "Mode: ${AUDIT_MODE}"
echo "Config: ${CONFIG_FILE}"
echo "Remediation: ${ENABLE_REMEDIATION}"
echo "============================================================"

# --- Run Policy Enforcer ---
echo "[AUDIT] Running policy enforcement checks..."
csh -f ./policy_enforcer.csh "${CONFIG_FILE}" "${OUTPUT_DIR}" "${AUDIT_MODE}"
set ENFORCER_EXIT = $status

if ( ${ENFORCER_EXIT} != 0 ) then
    echo "[ERROR] Policy enforcer exited with status: ${ENFORCER_EXIT}"
    exit ${ENFORCER_EXIT}
endif

# --- Run Remediation Handler (if enabled) ---
if ( "${ENABLE_REMEDIATION}" == "TRUE" ) then
    echo "[REMEDIATION] Scanning for actionable compliance failures..."
    csh -f ./remediation_handler.csh "${OUTPUT_DIR}"
    set REMEDIATION_EXIT = $status
    
    if ( ${REMEDIATION_EXIT} != 0 ) then
        echo "[WARNING] Remediation handler completed with warnings or failures: ${REMEDIATION_EXIT}"
    else
        echo "[REMEDIATION] Remediation cycle completed successfully."
    endif
endif

# --- Generate Final Report ---
echo "[REPORT] Generating final compliance report..."
echo "{\"audit_summary\": {" > ${REPORT_FILE}
echo "    \"timestamp\": \"`date -u '+%Y-%m-%dT%H:%M:%SZ'`\"," >> ${REPORT_FILE}
echo "    \"mode\": \"${AUDIT_MODE}\"," >> ${REPORT_FILE}
echo "    \"config_file\": \"${CONFIG_FILE}\"," >> ${REPORT_FILE}
echo "    \"total_checks\": 0," >> ${REPORT_FILE}
echo "    \"passed\": 0," >> ${REPORT_FILE}
echo "    \"failed\": 0," >> ${REPORT_FILE}
echo "    \"warnings\": 0," >> ${REPORT_FILE}
echo "    \"compliance_status\": \"UNKNOWN\"
