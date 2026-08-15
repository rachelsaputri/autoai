@echo off
setlocal enabledelayedexpansion

:: Main entry point for the Batch System Hardening Suite

echo ========================================
echo   Windows Security Baseline Enforcer
echo ========================================
echo.
echo Starting security audit and hardening process...
echo.

:: Check for administrator privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERROR] This script must be run as Administrator!
    echo Please right-click and select "Run as Administrator".
    pause
    exit /b 1
)

:: Step 1: Perform Configuration Audit
echo [1/4] Performing configuration audit...
call audit_configs.bat
if %errorLevel% neq 0 (
    echo [ERROR] Configuration audit failed!
    pause
    exit /b 1
)
echo Configuration audit completed successfully.
echo.

:: Step 2: Enforce Security Policies
echo [2/4] Enforcing security policies...
call enforce_policies.bat
if %errorLevel% neq 0 (
    echo [ERROR] Policy enforcement failed!
    pause
    exit /b 1
)
echo Security policies enforced successfully.
echo.

:: Step 3: Remediate Issues
echo [3/4] Executing automated remediation...
call remediate_issues.bat
if %errorLevel% neq 0 (
    echo [ERROR] Remediation process failed!
    pause
    exit /b 1
)
echo Automated remediation completed successfully.
echo.

:: Step 4: Generate Compliance Report
echo [4/4] Generating compliance report...
call generate_reports.bat
if %errorLevel% neq 0 (
    echo [ERROR] Report generation failed!
    pause
    exit /b 1
)
echo Compliance report generated successfully.
echo.

echo ========================================
echo   Hardening Process Completed
echo ========================================
echo Please review the compliance report for details.
echo Report saved to: %~dp0compliance_report.txt
pause
exit /b 0
