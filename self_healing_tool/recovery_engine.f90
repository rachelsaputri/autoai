      MODULE recovery_engine
      USE error_config
      USE error_handler
      IMPLICIT NONE

   CONTAINS

      FUNCTION apply_recovery(rec) RESULT(success)
         TYPE(ErrorRecord), INTENT(INOUT) :: rec
         LOGICAL :: success
         INTEGER :: retry_count

         success = .FALSE.
         IF (rec%recovery_type == RECOVERY_RETRY) THEN
            IF (rec%attempt_count < 5) THEN
               rec%attempt_count = rec%attempt_count + 1
               rec%is_resolved = .FALSE.
               success = .TRUE.
            END IF
         ELSE IF (rec%recovery_type == RECOVERY_FALLBACK) THEN
            rec%is_resolved = .TRUE.
            global_state%recovered_errors = global_state%recovered_errors + 1
            success = .TRUE.
         END IF
      END FUNCTION apply_recovery

      SUBROUTINE execute_recovery_loop()
         INTEGER :: i
         TYPE(ErrorRecord) :: rec

         DO i = 1, global_state%log_count
            rec = global_state%error_log(i)
            IF (.NOT. rec%is_resolved) THEN
               IF (apply_recovery(rec)) THEN
                  CALL log_error(rec)
               ELSE IF (rec%severity == ERR_SEVERITY_CRITICAL) THEN
                  ! Trigger shutdown or critical alert in real implementation
                  EXIT
               END IF
            END IF
         END DO
      END SUBROUTINE execute_recovery_loop

   END MODULE recovery_engine
