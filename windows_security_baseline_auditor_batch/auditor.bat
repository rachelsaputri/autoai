@echo off
setlocal enabledelayedexpansion

:: Master Orchestrator for Windows Security Baseline Auditor
:: Author: Autonomous AI Polyglot Software Engineer
:: Version: 1.0.0
:: Description: Coordinates registry checks, service enforcement, and reporting.

set "SCRIPT_DIR=%~dp0"
set "LOG_FILE=%SCRIPT_DIR%audit_log.txt"
set "REPORT_FILE=%SCRIPT_DIR%compliance_report.html"
set "BASELINE_FILE=%SCRIPT_DIR%baseline.dat"
set "COMPLIANCE_SCORE=0"
set "TOTAL_CHECKS=0"
set "PASSED_CHECKS=0"
set "FAILED_CHECKS=0"
set "WARNINGS=0"

:: Initialize Log
if exist "%LOG_FILE%" (
    move /y "%LOG_FILE%" "%LOG_FILE%.old" >nul 2>&1
)
echo [INFO] Audit started at %date% %time% > "%LOG_FILE%"
echo [INFO] Script Directory: %SCRIPT_DIR% >> "%LOG_FILE%"

:: Helper Functions
echo_info() {
    echo [%date% %time%] [INFO] %1 >> "%LOG_FILE%"
    echo %1
}

echo_warn() {
    echo [%date% %time%] [WARN] %1 >> "%LOG_FILE%"
    echo WARNING: %1
    set /a WARNINGS+=1
}

echo_error() {
    echo [%date% %time%] [ERROR] %1 >> "%LOG_FILE%"
    echo ERROR: %1
    set /a FAILED_CHECKS+=1
}

echo_pass() {
    echo [%date% %time%] [PASS] %1 >> "%LOG_FILE%"
    echo PASSED: %1
    set /a PASSED_CHECKS+=1
}

calculate_score() {
    if %TOTAL_CHECKS% gtr 0 (
        set /a COMPLIANCE_SCORE=(PASSED_CHECKS * 100) / TOTAL_CHECKS
    ) else (
        set "COMPLIANCE_SCORE=100"
    )
    echo_info "Compliance Score: %COMPLIANCE_SCORE%%"
}

generate_report() {
    echo_info "Generating compliance report..."
    (
        echo ^<html^>
        echo ^<head^>^<title^>Windows Security Baseline Audit Report^</title^>^</head^>
        echo ^<body^>
        echo ^<h1^>Windows Security Baseline Audit Report^</h1^>
        echo ^<p^>Generated on: %date% %time%^</p^>
        echo ^<h2^>Summary^</h2^>
        echo ^<ul^>
        echo ^<li^>Total Checks: %TOTAL_CHECKS%^</li^>
        echo ^<li^>Passed: %PASSED_CHECKS%^</li^>
        echo ^<li^>Failed: %FAILED_CHECKS%^</li^>
        echo ^<li^>Warnings: %WARNINGS%^</li^>
        echo ^<li^>Compliance Score: %COMPLIANCE_SCORE%%%^</li^>
        echo ^</ul^>
        echo ^<h2^>Detailed Log^</h2^>
        echo ^<pre^>
        type "%LOG_FILE%"
        echo ^</pre^>
        echo ^</body^>
        echo ^</html^>
    ) > "%REPORT_FILE%"
    echo_info "Report generated at %REPORT_FILE%"
}

:: Main Execution Flow
:main
    echo_info "Starting Windows Security Baseline Auditor..."

    :: Step 1: Registry Compliance Check
    echo_info "Step 1: Registry Compliance Check..."
    call "%SCRIPT_DIR%registry_checker.bat" >> "%LOG_FILE%" 2>&1
    if errorlevel 1 (
        echo_error "Registry check module encountered errors."
    )

    :: Step 2: Service Policy Enforcement
    echo_info "Step 2: Service Policy Enforcement..."
    call "%SCRIPT_DIR%service_enforcer.bat" >> "%LOG_FILE%" 2>&1
    if errorlevel 1 (
        echo_error "Service enforcement module encountered errors."
    )

    :: Step 3: Calculate Score
    call :calculate_score

    :: Step 4: Generate Report
    call :generate_report

    :: Step 5: Final Summary
    echo_info "Audit Complete."
    echo_info "Passed: %PASSED_CHECKS% | Failed: %FAILED_CHECKS% | Warnings: %WARNINGS% | Score: %COMPLIANCE_SCORE%%%"

    endlocal
    exit /b 0
