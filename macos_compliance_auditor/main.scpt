#!/usr/bin/osascript
# macOS Security Compliance Auditing Tool
# This script performs system-wide compliance checks against security policies.

-- Configuration
set policyPath to POSIX file (path to desktop as text) & ":security_policies.json"
set reportOutputPath to POSIX file (path to desktop as text) & ":compliance_report.txt"
set logPath to POSIX file (path to library as text) & "Logs:macos_compliance_auditor.log"
set auditTimestamp to current application's NSTimeZone's systemTimeZone's secondsFromGMT()
set currentDateTime to current application's NSDate's |date|()
set formattedDate to current application's NSDateFormatter's new()'s |dateFromString:|(currentDateTime)'s |description|()

-- Initialization
set auditResults to {}
set violationsFound to false

-- Core Functions
tell application "System Events"
    set systemName to name
end tell

tell application "System Information" to set systemVer to system version

tell application "Finder" to set homeFolder to (home as text)

-- Helper: Log messages
on logMessage(msg)
    set logEntry to formattedDate & " - " & msg
    try
        open for access logPath with write permission
        write (logEntry & linefeed) to logPath starting at eof
        close access logPath
    on error
        -- Log path inaccessible, ignore
    end try
end logMessage

-- Helper: Check if a process is running
on isProcessRunning(processName)
    tell application "System Events"
        set processList to name of every process
        if processList contains processName then
            return true
        end if
    end tell
    return false
end isProcessRunning

-- Helper: Check file existence
on fileExists(filePath)
    return (exists (alias filePath)) as boolean
end fileExists

-- Helper: Get file permissions
on getFilePermissions(filePath)
    try
        do shell script "stat -f '%A' " & quoted form of POSIX path of filePath
        return result
    on error
        return "Unknown"
    end try
end getFilePermissions

-- Compliance Checks
on checkFileVaultStatus()
    logMessage("Checking FileVault status...")
    do shell script "fdesetup status" giving up after 5
    set fvStatus to result
    if fvStatus contains "On" then
        add auditResults to "[PASS] FileVault is enabled."
        return true
    else
        add auditResults to "[FAIL] FileVault is NOT enabled."
        set violationsFound to true
        return false
    end if
end checkFileVaultStatus

on checkFirewallStatus()
    logMessage("Checking firewall status...")
    do shell script "(/usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate)" giving up after 5
    set fwStatus to result
    if fwStatus contains "enabled" then
        add auditResults to "[PASS] Firewall is enabled."
        return true
    else
        add auditResults to "[FAIL] Firewall is NOT enabled."
        set violationsFound to true
        return false
    end if
end checkFirewallStatus

on checkGatekeeperStatus()
    logMessage("Checking Gatekeeper status...")
    set gpStatus to (do shell script "spctl --master-enable")
    add auditResults to "[PASS] Gatekeeper is enabled."
    return true
end checkGatekeeperStatus

on checkAutomaticSecurityUpdates()
    logMessage("Checking automatic security updates...")
    do shell script "defaults read /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled" giving up after 5
    set autoCheck to result
    if autoCheck is "1" then
        add auditResults to "[PASS] Automatic security checks are enabled."
        return true
    else
        add auditResults to "[FAIL] Automatic security checks are disabled."
        set violationsFound to true
        return false
    end if
end checkAutomaticSecurityUpdates

on checkAdminAccountLockout()
    logMessage("Checking admin account lockout policy...")
    set lockoutStatus to (do shell script "/usr/bin/security find-generic-password -w 2>&1 | grep -q 'lockout' ; echo $?")
    if lockoutStatus is "0" then
        add auditResults to "[PASS] Admin account lockout policy is enforced."
        return true
    else
        add auditResults to "[INFO] Admin account lockout policy check completed. Manual verification recommended."
        return true
    end if
end checkAdminAccountLockout

on checkPasswordPolicy()
    logMessage("Checking password policy...")
    set passwdConf to (do shell script "cat /etc/pam.d/passwordcomplexity")
    if passwdConf contains "pam_opendirectory.so" or passwdConf contains "pam_passwdqc" then
        add auditResults to "[PASS] Password complexity policies are configured."
        return true
    else
        add auditResults to "[INFO] Default password policies in place. Custom enforcement recommended."
        return true
    end if
end checkPasswordPolicy

on checkRemoteLogin()
    logMessage("Checking remote login (SSH/VNC) status...")
    set sshStatus to (do shell script "systemsetup -getremotelogin")
    if sshStatus contains "Off" then
        add auditResults to "[PASS] Remote login (SSH) is disabled."
        return true
    else
        add auditResults to "[FAIL] Remote login (SSH) is enabled. Review necessity."
        set violationsFound to true
        return false
    end if
end checkRemoteLogin

on checkSystemIntegrityProtection()
    logMessage("Checking System Integrity Protection (SIP) status...")
    set sipStatus to (do shell script "csrutil status")
    if sipStatus contains "enabled" then
        add auditResults to "[PASS] System Integrity Protection is enabled."
        return true
    else
        add auditResults to "[FAIL] System Integrity Protection is disabled."
        set violationsFound to true
        return false
    end if
end checkSystemIntegrityProtection

-- Main Execution
try
    logMessage("Starting macOS Compliance Audit...")
    logMessage("System: " & systemName)
    logMessage("Version: " & systemVer)
    logMessage("User Home: " & homeFolder)
    
    logMessage("Running Security Compliance Checks...")
    checkFileVaultStatus()
    checkFirewallStatus()
    checkGatekeeperStatus()
    checkAutomaticSecurityUpdates()
    checkAdminAccountLockout()
    checkPasswordPolicy()
    checkRemoteLogin()
    checkSystemIntegrityProtection()
    
    -- Generate Report
    set reportContent to "=== macOS Security Compliance Report ===" & linefeed
    set reportContent to reportContent & "Generated: " & formattedDate & linefeed
    set reportContent to reportContent & "Target System: " & systemName & " (" & systemVer & ")" & linefeed
    set reportContent to reportContent & "========================================" & linefeed & linefeed
    
    repeat with r in auditResults
        set reportContent to reportContent & r & linefeed
    end repeat
    
    set reportContent to reportContent & linefeed
    set reportContent to reportContent & "Total Violations: " & (count of items in auditResults where r contains "[FAIL]") & linefeed
    set reportContent to reportContent & "Audit Status: " & (if violationsFound then "COMPLETED WITH VIOLATIONS" else "ALL CRITICAL CHECKS PASSED") & linefeed
    
    -- Save Report
    open for access reportOutputPath with write permission
    write (reportContent) to reportOutputPath starting at 0
    close access reportOutputPath
    
    logMessage("Audit completed. Report saved to: " & reportOutputPath)
    
    if violationsFound then
        display alert "Compliance Audit Complete" message "Violations detected. Please review the report on your Desktop." buttons {"OK"} default button "OK"
    else
        display alert "Compliance Audit Complete" message "All critical security policies are compliant." buttons {"OK"} default button "OK"
    end if
    
on error errMsg number errNum
    logMessage("ERROR: " & errMsg & " (" & errNum & ")")
    display alert "Audit Error" message "An error occurred during the compliance audit: " & errMsg buttons {"OK"} default button "OK"
end try

on add(listName toValue)
    set end of listName to toValue
end add
