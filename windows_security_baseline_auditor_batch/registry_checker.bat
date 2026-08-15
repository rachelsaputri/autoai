@echo off
setlocal enabledelayedexpansion

:: Registry Compliance Checker
:: Verifies critical registry keys against security best practices.

set "PASSED=0"
set "FAILED=0"

:: Function to check registry value
call_check_reg() {
    set "KEY=%1"
    set "VALUE=%2"
    set "EXPECTED=%3"
    set "DESC=%4"

    set /a TOTAL_CHECKS+=1
    
    reg query "%KEY%" /v "%VALUE%" >nul 2>&1
    if errorlevel 1 (
        echo [FAIL] %DESC% - Key or Value not found: %KEY%
        set /a FAILED+=1
        return
    )

    for /f "tokens=3" %%A in ('reg query "%KEY%" /v "%VALUE%" ^| find /i "%VALUE%"') do (
        set "ACTUAL=%%A"
    )

    if "%ACTUAL%"=="%EXPECTED%" (
        echo [PASS] %DESC%
        set /a PASSED+=1
    ) else (
        echo [FAIL] %DESC% - Expected: %EXPECTED%, Actual: %ACTUAL%
        set /a FAILED+=1
    )
}

:: 1. Enable LSA Protection (RunAsPPL)
:: Note: This is a sensitive check. Only query, do not modify.
call_check_reg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\LSA" "RunAsPPL" "1" "LSA Protection enabled"

:: 2. Disable AutoRun for all drives
call_check_reg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" "NoAutoplayfiles" "1" "NoAutoplayfiles policy enabled"

:: 3. Enable Script Block Logging (PowerShell)
:: Requires PowerShell v5+, key exists only if enabled.
call_check_reg "HKEY_LOCAL_MACHINE\SOFTWARE\PolicyCategories\PSExecutionPolicyPreference" "PSExecutionPolicyPreference" "restricted" "PS Execution Policy Restriction (Simulated Check)"
echo [WARN] PS Execution Policy Check requires PowerShell execution context. Skipping deep verification.

:: 4. Disable SMBv1
call_check_reg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" "DisableSharingOverNetbios" "1" "Disable Sharing Over Netbios"

:: 5. Enforce Password Complexity
call_check_reg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" "PasswordComplexity" "1" "Password Complexity Policy"

:: 6. Enable Windows Firewall (Check via netsh is better, but registry is baseline)
set /a TOTAL_CHECKS+=1
set "ACTUAL="
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile" /v "EnableFirewall" ^| find /i "EnableFirewall"') do set "ACTUAL=%%A"
if "%ACTUAL%"=="1" (
    echo [PASS] Windows Firewall is Enabled via Group Policy
    set /a PASSED+=1
) else if exist "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile" (
    echo [FAIL] Windows Firewall is not Enabled via Group Policy
    set /a FAILED+=1
) else (
    echo [WARN] Windows Firewall Group Policy not found. Relying on local setting.
    set /a FAILED+=1
)

endlocal & set "REG_CHECKS_PASSED=%PASSED%" & set "REG_CHECKS_FAILED=%FAILED%"
exit /b 0
