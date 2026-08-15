@echo off
setlocal enabledelayedexpansion

:: Batch script for automated remediation of non-compliant settings
:: This script reads the audit results and applies fixes for detected issues

echo ========================================
echo   Executing Automated Remediation
echo ========================================
echo.

set AUDIT_LOG=%~dp0audit_results.txt

if not exist "%AUDIT_LOG%" (
    echo [ERROR] Audit log not found. Please run the configuration audit first.
    exit /b 1
)

:: Remediate: Enable Windows Firewall if disabled
findstr /i "[FAIL] Windows Firewall is disabled" "%AUDIT_LOG%" >nul 2>&1
if %errorLevel% equ 0 (
    echo [REMEDIATE] Enabling Windows Firewall...
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v EnableFirewall /t REG_DWORD /d 1 /f >nul 2>&1
    if %errorLevel% equ 0 (
        echo [OK] Windows Firewall has been enabled.
    ) else (
        echo [FAIL] Failed to enable Windows Firewall.
    )
)

:: Remediate: Start Windows Update service if stopped
findstr /i "[FAIL] Windows Update service is not running" "%AUDIT_LOG%" >nul 2>&1
if %errorLevel% equ 0 (
    echo [REMEDIATE] Starting Windows Update service...
    sc config wuauserv start= demand >nul 2>&1
    sc start wuauserv >nul 2>&1
    if %errorLevel% equ 0 (
        echo [OK] Windows Update service has been started.
    ) else (
        echo [FAIL] Failed to start Windows Update service.
    )
)

:: Remediate: Enable Password Complexity if disabled
findstr /i "[FAIL] Password complexity is not enabled" "%AUDIT_LOG%" >nul 2>&1
if %errorLevel% equ 0 (
    echo [REMEDIATE] Enabling password complexity...
    net accounts /uniquepw:5 /minpwlen:8 /maxpwage:90 /minpwage:1 >nul 2>&1
    if %errorLevel% equ 0 (
        echo [OK] Password complexity policy has been updated.
    ) else (
        echo [FAIL] Failed to update password policy.
    )
)

:: Remediate: Disable Administrator account if active
findstr /i "[INFO] Administrator account is active" "%AUDIT_LOG%" >nul 2>&1
if %errorLevel% equ 0 (
    echo [REMEDIATE] Disabling Administrator account...
    net user administrator /active:no >nul 2>&1
    if %errorLevel% equ 0 (
        echo [OK] Administrator account has been disabled.
    ) else (
        echo [FAIL] Failed to disable Administrator account.
    )
)

echo ========================================
echo   Remediation Completed
echo ========================================
exit /b 0
