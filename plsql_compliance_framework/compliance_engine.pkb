CREATE OR REPLACE PACKAGE BODY cpm_engine IS

  PROCEDURE run_audit(p_policy_name IN VARCHAR2, p_result OUT BOOLEAN) IS
    v_rule CLOB;
    v_compliant BOOLEAN := TRUE;
    v_severity VARCHAR2(20);
  BEGIN
    v_rule := cpm_policy_manager.get_active_policy_rule(p_policy_name);
    SELECT severity_level INTO v_severity FROM cpm_policies WHERE policy_name = p_policy_name AND is_active = 1;

    -- Example Rule Evaluation Logic
    -- In a real scenario, this would parse 'v_rule' and query system views (DBA_*, V$*)
    IF v_rule LIKE '%PASSWORD_POLICY%' THEN
      -- Check Oracle Password Complexity
      IF check_password_policy() = FALSE THEN
        v_compliant := FALSE;
        cpm_audit_logger.log_event('RULE_VIOLATION', NULL, 'PASSWORD_POLICY', 'FAIL', 
          'Password policy violation detected.');
        cpm_remediation.create_remediation(p_policy_name, 'CONFIG_CHANGE', 
          'ALTER SYSTEM SET RESOURCE_LIMIT=TRUE;', 'HIGH');
      END IF;
    ELSIF v_rule LIKE '%AUDIT_TRAIL%' THEN
      -- Check Audit Trail Status
      IF get_audit_trail_status() = 'NONE' THEN
        v_compliant := FALSE;
        cpm_audit_logger.log_event('RULE_VIOLATION', NULL, 'AUDIT_TRAIL', 'FAIL', 
          'Audit trail is disabled.');
        cpm_remediation.create_remediation(p_policy_name, 'CONFIG_CHANGE', 
          'ALTER SYSTEM SET AUDIT_TRAIL=DB SCOPE=SPFILE;', 'CRITICAL');
      END IF;
    END IF;

    p_result := v_compliant;
    
    IF v_compliant THEN
      cpm_audit_logger.log_event('AUDIT_COMPLETE', NULL, 'ENGINE', 'PASS', 
        'Policy ' || p_policy_name || ' passed.');
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      p_result := FALSE;
      cpm_audit_logger.log_event('AUDIT_ERROR', NULL, 'ENGINE', 'FAIL', SQLERRM);
  END run_audit;

  FUNCTION check_password_policy RETURN BOOLEAN IS
    v_param VARCHAR2(30);
  BEGIN
    SELECT value INTO v_param FROM dba_profiles WHERE profile = 'DEFAULT' AND resource_name = 'PASSWORD_VERIFY_FUNCTION';
    RETURN v_param != 'NULL';
  EXCEPTION
    WHEN NO_DATA_FOUND THEN RETURN FALSE;
    WHEN OTHERS THEN RETURN FALSE;
  END check_password_policy;

  FUNCTION get_audit_trail_status RETURN VARCHAR2 IS
    v_param VARCHAR2(30);
  BEGIN
    SELECT value INTO v_param FROM v$parameter WHERE name = 'audit_trail';
    RETURN v_param;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN RETURN 'NONE';
  END get_audit_trail_status;

END cpm_engine;
