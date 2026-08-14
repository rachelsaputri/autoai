      MODULE error_config
      USE, INTRINSIC :: ISO_FORTRAN_ENV
      IMPLICIT NONE

      ! Error severity levels
      INTEGER, PARAMETER :: ERR_SEVERITY_CRITICAL = 1
      INTEGER, PARAMETER :: ERR_SEVERITY_WARNING = 2
      INTEGER, PARAMETER :: ERR_SEVERITY_RETRYABLE = 3
      INTEGER, PARAMETER :: ERR_SEVERITY_SILENT = 4

      ! Recovery strategies
      INTEGER, PARAMETER :: RECOVERY_NONE = 0
      INTEGER, PARAMETER :: RECOVERY_RETRY = 1
      INTEGER, PARAMETER :: RECOVERY_FALLBACK = 2
      INTEGER, PARAMETER :: RECOVERY_SHUTDOWN = 3

      TYPE ErrorRecord
         CHARACTER(LEN=256) :: error_code
         CHARACTER(LEN=1024) :: error_message
         INTEGER :: severity
         INTEGER :: recovery_type
         INTEGER :: attempt_count
         INTEGER :: timestamp
         LOGICAL :: is_resolved
      END TYPE ErrorRecord

      TYPE(Configuration)
         INTEGER :: max_retries
         INTEGER :: retry_delay_ms
         LOGICAL :: enable_audit
         LOGICAL :: enable_metrics
      END TYPE Configuration

   CONTAINS

      SUBROUTINE init_config(cfg)
         TYPE(Configuration), INTENT(OUT) :: cfg
         cfg%max_retries = 3
         cfg%retry_delay_ms = 1000
         cfg%enable_audit = .TRUE.
         cfg%enable_metrics = .TRUE.
      END SUBROUTINE init_config

   END MODULE error_config
