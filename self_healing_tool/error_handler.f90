      MODULE error_handler
      USE ISO_FORTRAN_ENV
      USE error_config
      IMPLICIT NONE

      TYPE(StateManager)
         TYPE(ErrorRecord), DIMENSION(100) :: error_log
         INTEGER :: log_count
         INTEGER :: critical_errors
         INTEGER :: warning_errors
         INTEGER :: recovered_errors
         LOGICAL :: is_active
      END TYPE StateManager

      TYPE(StateManager) :: global_state
      INTEGER :: global_state_initialized = 0

   CONTAINS

      SUBROUTINE init_state()
         global_state%log_count = 0
         global_state%critical_errors = 0
         global_state%warning_errors = 0
         global_state%recovered_errors = 0
         global_state%is_active = .TRUE.
         global_state_initialized = 1
      END SUBROUTINE init_state

      FUNCTION classify_error(severity) RESULT(code)
         INTEGER, INTENT(IN) :: severity
         CHARACTER(LEN=32) :: code

         SELECT CASE(severity)
         CASE(ERR_SEVERITY_CRITICAL)
            code = "CRIT_001"
            global_state%critical_errors = global_state%critical_errors + 1
         CASE(ERR_SEVERITY_WARNING)
            code = "WARN_001"
            global_state%warning_errors = global_state%warning_errors + 1
         CASE(ERR_SEVERITY_RETRYABLE)
            code = "RETRY_001"
         CASE DEFAULT
            code = "SILENT_001"
         END SELECT
      END FUNCTION classify_error

      SUBROUTINE log_error(rec)
         TYPE(ErrorRecord), INTENT(IN) :: rec

         IF (.NOT. global_state%is_active) RETURN

         global_state%log_count = global_state%log_count + 1
         IF (global_state%log_count > 100) global_state%log_count = 1

         global_state%error_log(global_state%log_count) = rec
      END SUBROUTINE log_error

      FUNCTION get_state() RESULT(state)
         TYPE(StateManager) :: state
         state = global_state
      END FUNCTION get_state

   END MODULE error_handler
