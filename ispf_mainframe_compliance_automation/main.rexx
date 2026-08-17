/* REXX */
/* Main Entry Point for ISPF Mainframe Compliance Automation */

parse arg action

/* Initialize ISPF if not already active */
rc = 0
ispserv = 'ISPEXEC'
if ispelib('ISP') then do
  /* ISPF already active */
end else do
  /* Attempt to activate ISPF */
  rc = 0
  /* Note: In a real mainframe environment, ispf activation might be handled externally */
end

/* Set up main menu variables */
audit_flag = 'N'
drift_flag = 'N'
report_flag = 'N'

/* Route based on action or display menu */
if action = '' then do
  call display_main_menu
end else do
  select
    when action = 'AUDIT' then call run_audit
    when action = 'DRIFT' then call run_drift_check
    when action = 'REPORT' then call generate_report
    when action = 'EXIT' then exit 0
    otherwise do
      say 'Unknown action: ' action
      say 'Valid actions: AUDIT, DRIFT, REPORT, EXIT'
      exit 8
    end
  end
end

exit 0

/* Subroutines */
display_main_menu:
  say 'ISPF Mainframe Compliance Automation Utility'
  say '---------------------------------------------'
  say '1. Run Full Compliance Audit'
  say '2. Check Configuration Drift'
  say '3. Generate Compliance Report'
  say '4. Exit'
  say '---------------------------------------------'
  parse pull choice
  if choice = '1' then do
    audit_flag = 'Y'
    call run_audit
  end else if choice = '2' then do
    drift_flag = 'Y'
    call run_drift_check
  end else if choice = '3' then do
    report_flag = 'Y'
    call generate_report
  end else if choice = '4' then do
    exit 0
  end else do
    say 'Invalid selection. Please try again.'
    call display_main_menu
  end
  return

run_audit:
  say 'Starting full compliance audit...'
  /* Load audit engine */
  rc = rxfuncadd('audit_init', 'audit_engine', 'audit_init')
  if rc = 0 then do
    rc = audit_init()
    if rc = 0 then do
      rc = audit_engine()
    end
  end else do
    say 'Failed to load audit engine.'
  end
  return

run_drift_check:
  say 'Starting configuration drift check...'
  rc = rxfuncadd('drift_init', 'drift_detector', 'drift_init')
  if rc = 0 then do
    rc = drift_init()
    if rc = 0 then do
      rc = drift_engine()
    end
  end else do
    say 'Failed to load drift detector.'
  end
  return

generate_report:
  say 'Generating compliance report...'
  rc = rxfuncadd('report_init', 'reporter', 'report_init')
  if rc = 0 then do
    rc = report_init()
    if rc = 0 then do
      rc = report_engine()
    end
  end else do
    say 'Failed to load reporter.'
  end
  return
