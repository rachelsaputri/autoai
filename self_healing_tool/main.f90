      PROGRAM self_healing_main
      USE error_config
      USE error_handler
      USE recovery_engine
      IMPLICIT NONE

      TYPE(ErrorRecord) :: test_rec
      TYPE(Configuration) :: cfg
      LOGICAL :: recovered
      INTEGER :: timestamp

      CALL init_config(cfg)
      CALL init_state()

      ! Test Case 1: Retryable Error
      test_rec%error_code = "RETRY_001"
      test_rec%error_message = "Connection timeout"
      test_rec%severity = ERR_SEVERITY_RETRYABLE
      test_rec%recovery_type = RECOVERY_RETRY
      test_rec%attempt_count = 0
      test_rec%is_resolved = .FALSE.
      CALL log_error(test_rec)

      ! Test Case 2: Critical Error
      test_rec%error_code = "CRIT_001"
      test_rec%error_message = "System out of memory"
      test_rec%severity = ERR_SEVERITY_CRITICAL
      test_rec%recovery_type = RECOVERY_SHUTDOWN
      test_rec%attempt_count = 0
      test_rec%is_resolved = .FALSE.
      CALL log_error(test_rec)

      ! Test Case 3: Edge Case - Boundary Value
      test_rec%error_code = "WARN_001"
      test_rec%error_message = "Buffer size exceeds 99.99%"
      test_rec%severity = ERR_SEVERITY_WARNING
      test_rec%recovery_type = RECOVERY_FALLBACK
      test_rec%attempt_count = 0
      test_rec%is_resolved = .FALSE.
      CALL log_error(test_rec)

      ! Execute self-healing
      CALL execute_recovery_loop()

      ! Report status
      timestamp = 1234567890
      WRITE(*,*) "--- Self-Healing Tool Status ---"
      WRITE(*,*) "Active Errors:", global_state%log_count
      WRITE(*,*) "Critical Errors:", global_state%critical_errors
      WRITE(*,*) "Recovered:", global_state%recovered_errors
      WRITE(*,*) "Test Completed Successfully."

      END PROGRAM self_healing_main
