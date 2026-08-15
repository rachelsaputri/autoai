@echo off
setlocal enabledelayedexpansion

:: Batch script for auditing system configurations
:: This script checks critical system configurations and logs results

set AUDIT_LOG=%~dp0audit_results.txt
echo [AUDIT] Starting system configuration audit...

:: Clear previous audit log
if exist "%AUDIT_LOG%" del "%AUDIT_LOG%"

echo ======================================== >> "%AUDIT_LOG%"
echo System Configuration Audit Report >> "%AUDIT_LOG%"
echo Date: %date% %time% >> "%AUDIT_LOG%"
echo ======================================== >> "%AUDIT_LOG%"
echo.

:: Check 1: Windows Firewall Status
echo [CHECK] Checking Windows Firewall status...
reg query "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v EnableFirewall >nul 2>&1
if %errorLevel% equ 0 (
    reg query "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v EnableFirewall
    if !errorLevel! equ 1 (
        echo [FAIL] Windows Firewall is disabled. >> "%AUDIT_LOG%"
    ) else (
        echo [PASS] Windows Firewall is enabled. >> "%AUDIT_LOG%"
    )
) else (
    echo [WARN] Unable to query Windows Firewall status. >> "%AUDIT_LOG%"
)
echo.

:: Check 2: Auto-Update Service Status
echo [CHECK] Checking Windows Update service status...
sc query wuauserv | find "RUNNING" >nul 2>&1
if %errorLevel% equ 0 (
    echo [PASS] Windows Update service is running. >> "%AUDIT_LOG%"
) else (
    echo [FAIL] Windows Update service is not running. >> "%AUDIT_LOG%"
)
echo.

:: Check 3: Password Policy Complexity
echo [CHECK] Checking password policy complexity...
net accounts | find "Password complexity" >nul 2>&1
if %errorLevel% equ 0 (
    echo [PASS] Password complexity is enabled. >> "%AUDIT_LOG%"
) else (
    echo [FAIL] Password complexity is not enabled. >> "%AUDIT_LOG%"
)
echo.

:: Check 4: Administrator Account Status
echo [CHECK] Checking Administrator account status...
net user administrator | find "Active" >nul 2>&1
if %errorLevel% equ 0 (
    echo [INFO] Administrator account is active. >> "%AUDIT_LOG%"
) else (
    echo [PASS] Administrator account is disabled. >> "%AUDIT_LOG%"
)
echo.

echo ======================================== >> "%AUDIT_LOG%"
echo Audit completed. >> "%AUDIT_LOG%"
echo ======================================== >> "%AUDIT_LOG%"

echo Configuration audit completed. Results saved to %AUDIT_LOG%
exit /b 0
