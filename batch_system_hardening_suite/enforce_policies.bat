@echo off
setlocal enabledelayedexpansion

:: Batch script for enforcing registry-based security policies
:: This script applies recommended security settings via registry modifications

echo ========================================
echo   Enforcing Security Policies
echo ========================================
echo.

:: Policy 1: Enable Windows Firewall
echo [POLICY] Enabling Windows Firewall...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v EnableFirewall /t REG_DWORD /d 1 /f >nul 2>&1
if %errorLevel% equ 0 (
    echo [OK] Windows Firewall has been enabled.
) else (
    echo [FAIL] Failed to enable Windows Firewall.
)
echo.

:: Policy 2: Enable Windows Update Service
echo [POLICY] Enabling Windows Update service...
sc config wuauserv start= demand >nul 2>&1
sc start wuauserv >nul 2>&1
if %errorLevel% equ 0 (
    echo [OK] Windows Update service has been started.
) else (
    echo [FAIL] Failed to start Windows Update service.
)
echo.

:: Policy 3: Enable Password Complexity
echo [POLICY] Enabling password complexity...
net accounts /uniquepw:5 /minpwlen:8 /maxpwage:90 /minpwage:1 >nul 2>&1
if %errorLevel% equ 0 (
    echo [OK] Password complexity policy has been updated.
) else (
    echo [FAIL] Failed to update password policy.
)
echo.

:: Policy 4: Disable Administrator Account
echo [POLICY] Disabling Administrator account...
net user administrator /active:no >nul 2>&1
if %errorLevel% equ 0 (
    echo [OK] Administrator account has been disabled.
) else (
    echo [FAIL] Failed to disable Administrator account.
)
echo.

echo ========================================
echo   Policy Enforcement Completed
echo ========================================
exit /b 0
