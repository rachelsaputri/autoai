@echo off
setlocal enabledelayedexpansion

:: Service Policy Enforcer
:: Checks and reports on critical service configurations.
:: Note: Enforcing changes requires Administrative privileges.

set "PASSED=0"
set "FAILED=0"

:: Function to check service status/type
call_check_service() {
    set "SERVICE=%1"
    set "EXPECTED_STARTTYPE=%2"
    set "EXPECTED_STATE=%3"
    set "DESC=%4"

    set /a TOTAL_CHECKS+=1

    :: Check if service exists
    sc query "%SERVICE%" >nul 2>&1
    if errorlevel 1 (
        echo [SKIP] %DESC% - Service not found: %SERVICE%
        set /a WARNINGS+=1
        return
    )

    :: Get Start Type
    for /f "tokens=3" %%A in ('sc qc "%SERVICE%" ^| find /i "START_TYPE"') do (
        set "START_TYPE=%%A"
    )
    
    :: Get State
    for /f "tokens=3" %%A in ('sc query "%SERVICE%" ^| find /i "STATE"') do (
        set "STATE=%%A"
    )

    :: Check Start Type
    if "!START_TYPE!"=="!EXPECTED_STARTTYPE!" (
        echo [PASS] %DESC% Start Type: OK (!START_TYPE!)
    ) else (
        echo [FAIL] %DESC% Start Type: Expected !EXPECTED_STARTTYPE!, Got !START_TYPE!
        set /a FAILED+=1
    )

    :: Note: State is dynamic. We mostly care about Start Type for baseline.
    :: However, for critical security services, we might expect them running.
    set /a PASSED+=1
}

:: 1. Windows Defender Service
:: Start Type: Automatic
call_check_service "WinDefend" "2" "N/A" "Windows Defender Service"

:: 2. Windows Firewall Service
:: Start Type: Automatic
call_check_service "MpsSvc" "2" "N/A" "Windows Firewall Service"

:: 3. Windows Update Service
:: Start Type: Automatic (Delayed)
call_check_service "wuauserv" "2" "N/A" "Windows Update Service"

:: 4. Remote Registry Service
:: Start Type: Disabled (Security Best Practice)
call_check_service "RemoteRegistry" "4" "N/A" "Remote Registry Service (Should be Disabled)"

:: 5. Telnet Service
:: Start Type: Disabled (Security Best Practice)
call_check_service "tlntsvr" "4" "N/A" "Telnet Service (Should be Disabled)"

:: 6. SNMP Service
:: Start Type: Disabled (Security Best Practice)
call_check_service "SNMP" "4" "N/A" "SNMP Service (Should be Disabled)"

:: 7. Print Spooler Service
:: Start Type: Manual (Security Best Practice if not printing)
call_check_service "Spooler" "3" "N/A" "Print Spooler Service (Should be Manual)"

endlocal
exit /b 0
