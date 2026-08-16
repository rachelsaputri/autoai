CREATE OR REPLACE PACKAGE BODY cpm_policy_manager IS

  PROCEDURE register_policy(
    p_name      IN VARCHAR2,
    p_rule      IN CLOB,
    p_severity  IN VARCHAR2,
    p_version   IN NUMBER DEFAULT 1
  ) IS
    v_existing_version NUMBER;
    v_new_version      NUMBER;
  BEGIN
    SELECT NVL(MAX(policy_version), 0) + 1 
    INTO v_new_version 
    FROM cpm_policies 
    WHERE policy_name = p_name;

    INSERT INTO cpm_policies (policy_name, rule_description, severity_level, policy_version, is_active)
    VALUES (p_name, p_rule, p_severity, v_new_version, 1);

    cpm_audit_logger.log_event('POLICY_REGISTER', NULL, 'POLICY_MANAGER', 'INFO', 
      'Policy ' || p_name || ' v' || v_new_version || ' registered.');

  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE;
  END register_policy;

  PROCEDURE deactivate_policy(p_policy_name IN VARCHAR2) IS
  BEGIN
    UPDATE cpm_policies 
    SET is_active = 0, updated_at = CURRENT_TIMESTAMP 
    WHERE policy_name = p_policy_name AND is_active = 1;

    IF SQL%ROWCOUNT = 0 THEN
      RAISE_APPLICATION_ERROR(-20001, 'Policy not found or already inactive.');
    END IF;

    cpm_audit_logger.log_event('POLICY_DEACTIVATE', NULL, 'POLICY_MANAGER', 'INFO', 
      'Policy ' || p_policy_name || ' deactivated.');
  END deactivate_policy;

  FUNCTION get_active_policy_rule(p_policy_name IN VARCHAR2) RETURN CLOB IS
    v_rule CLOB;
  BEGIN
    SELECT rule_description 
    INTO v_rule 
    FROM cpm_policies 
    WHERE policy_name = p_policy_name AND is_active = 1
    ORDER BY policy_version DESC;
    
    RETURN v_rule;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE_APPLICATION_ERROR(-20002, 'Active policy not found: ' || p_policy_name);
  END get_active_policy_rule;

END cpm_policy_manager;
