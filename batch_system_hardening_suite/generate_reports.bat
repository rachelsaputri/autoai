@echo off
setlocal enabledelayedexpansion

:: Batch script for generating compliance reports
:: This script creates a comprehensive compliance report based on audit results

echo ========================================
echo   Generating Compliance Report
echo ========================================
echo.

set AUDIT_LOG=%~dp0audit_results.txt
set REPORT_FILE=%~dp0compliance_report.txt

if not exist "%AUDIT_LOG%" (
    echo [ERROR] Audit log not found. Please run the configuration audit first.
    exit /b 1
)

:: Copy audit results to report file
copy /y "%AUDIT_LOG%" "%REPORT_FILE%" >nul 2>&1

:: Add summary section to report
(echo.
echo ======================================== >> "%REPORT_FILE%"
echo Compliance Report Summary >> "%REPORT_FILE%"
echo ======================================== >> "%REPORT_FILE%"
echo.
echo The following items were audited: >> "%REPORT_FILE%"
echo - Windows Firewall Status >> "%REPORT_FILE%"
echo - Windows Update Service Status >> "%REPORT_FILE%"
echo - Password Policy Complexity >> "%REPORT_FILE%"
echo - Administrator Account Status >> "%REPORT_FILE%"
echo.
echo Remediation actions were taken for any failed checks. >> "%REPORT_FILE%"
echo Please review the audit details above for specific findings. >> "%REPORT_FILE%"
echo.
echo ======================================== >> "%REPORT_FILE%"
echo End of Compliance Report >> "%REPORT_FILE%"
echo ======================================== >> "%REPORT_FILE%" >>nul 2>&1)

echo Compliance report generated successfully.
echo Report saved to: %REPORT_FILE%
exit /b 0
