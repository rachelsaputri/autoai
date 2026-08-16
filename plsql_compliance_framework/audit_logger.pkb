CREATE OR REPLACE PACKAGE BODY cpm_audit_logger IS

  PROCEDURE log_event(
    p_event_type IN VARCHAR2,
    p_policy_id  IN NUMBER,
    p_component  IN VARCHAR2,
    p_status     IN VARCHAR2,
    p_details    IN VARCHAR2
  ) IS
  BEGIN
    INSERT INTO cpm_audit_log (event_type, policy_id, component, status, details)
    VALUES (p_event_type, p_policy_id, p_component, p_status, p_details);

    COMMIT; -- Ensure persistence for audit trail
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20003, 'Audit logging failed: ' || SQLERRM);
  END log_event;

  FUNCTION get_recent_logs(p_limit IN NUMBER DEFAULT 100) RETURN SYS_REFCURSOR IS
    v_cur SYS_REFCURSOR;
  BEGIN
    OPEN v_cur FOR
      SELECT * FROM cpm_audit_log 
      ORDER BY created_at DESC 
      FETCH FIRST p_limit ROWS ONLY;
    
    RETURN v_cur;
  END get_recent_logs;

END cpm_audit_logger;
