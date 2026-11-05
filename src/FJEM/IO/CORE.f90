MODULE FJEM_IO_CORE
  USE FJEM_CORE
  IMPLICIT NONE
  PRIVATE
  PUBLIC file_exists

  CONTAINS
    FUNCTION file_exists(file_loc) RESULT (res)
      CHARACTER(LEN=*), INTENT(IN) :: file_loc
      LOGICAL :: res

      INQUIRE(file=trim(file_loc), exist=res)
    END FUNCTION file_exists
END MODULE FJEM_IO_CORE
