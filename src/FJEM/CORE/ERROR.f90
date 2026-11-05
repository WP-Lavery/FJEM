MODULE FJEM_CORE_ERROR
  USE, INTRINSIC :: iso_fortran_env, only: error_unit
  IMPLICIT NONE
  PRIVATE
  PUBLIC throw_error, throw_warning

  CHARACTER(LEN=*), PARAMETER :: ESC = ACHAR(27)
  CONTAINS
    SUBROUTINE throw_error(msg, code)
      CHARACTER(LEN=*), INTENT(IN) :: msg
      INTEGER, OPTIONAL, INTENT(IN) :: code
      INTEGER :: err_code

      IF (PRESENT(code)) THEN
        err_code = code
      ELSE
        err_code = 1
      END IF

      write(error_unit, '(a)') ESC // "[1;31m" // "ERROR: " // TRIM(msg)
      ERROR STOP err_code
    END SUBROUTINE throw_error

    SUBROUTINE throw_warning(msg)
      CHARACTER(LEN=*), INTENT(IN) :: msg

      write(error_unit, '(a)') ESC // "[1;33m" // "WARNING: " // TRIM(msg) // ESC // "[0m"
    END SUBROUTINE throw_warning
END MODULE FJEM_CORE_ERROR
