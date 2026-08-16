CREATE OR REPLACE PACKAGE BODY cpm_report_generator IS

  PROCEDURE generate_json_report(p_policy_name IN VARCHAR2, p_output IN OUT CLOB) IS
    v_audit_cursor SYS_REFCURSOR;
    v_drift_cursor SYS_REFCURSOR;
    v_json         CLOB := '{"audit_report": {"policy": "' || p_policy_name || '", "reports": [';
    v_first        BOOLEAN := TRUE;
    v_record       cpm_audit_log%ROWTYPE;
    v_drift_record cpm_drift_history%ROWTYPE;
  BEGIN
    -- Inject Audit Logs
    v_audit_cursor := cpm_audit_logger.get_recent_logs(50);
    LOOP
      FETCH v_audit_cursor INTO v_record;
      EXIT WHEN v_audit_cursor%NOTFOUND;
      
      IF NOT v_first THEN
        v_json := v_json || ',';
      END IF;
      
      v_json := v_json || 
        '{
