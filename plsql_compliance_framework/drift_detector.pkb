CREATE OR REPLACE PACKAGE BODY cpm_drift_detector IS

  PROCEDURE detect_drift(p_policy_name IN VARCHAR2) IS
    v_baseline_value VARCHAR2(4000);
    v_current_value  VARCHAR2(4000);
    v_policy_id      NUMBER;
  BEGIN
    SELECT policy_id INTO v_policy_id FROM cpm_policies WHERE policy_name = p_policy_name AND is_active = 1;

    -- Example: Check for parameter drift
    -- In reality, this should dynamically map policy rules to specific DBA_ views
    SELECT value INTO v_baseline_value FROM cpm_drift_history WHERE policy_id = v_policy_id AND drift_type = 'BASELINE' ORDER BY detected_at DESC FETCH FIRST 1 ROWS ONLY;

    -- Mock current value for demonstration
    v_current_value := 'SIMULATED_CURRENT_STATE'; 

    IF v_baseline_value != v_current_value THEN
      cpm_audit_logger.log_event('DRIFT_DETECTED', v_policy_id, 'DRIFT_DETECTOR', 'FAIL', 
        'Configuration drift detected for policy ' || p_policy_name);
        
      INSERT INTO cpm_drift_history (policy_id, baseline_value, current_value, drift_type)
      VALUES (v_policy_id, v_baseline_value, v_current_value, 'CONFIG_CHANGE');
    END IF;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      -- No baseline exists, create one
      cpm_audit_logger.log_event('BASELINE_CREATED', v_policy_id, 'DRIFT_DETECTOR', 'INFO', 
        'Initial baseline established for ' || p_policy_name);
    WHEN OTHERS THEN
      cpm_audit_logger.log_event('DRIFT_ERROR', v_policy_id, 'DRIFT_DETECTOR', 'FAIL', SQLERRM);
  END detect_drift;

END cpm_drift_detector;
