MODULE FJEM_IO_ARGS
  USE FJEM_CORE
  IMPLICIT NONE
  PRIVATE
  PUBLIC shell_argument_reader

  TYPE :: shell_argument_reader
    INTEGER :: arg_count
    TYPE(string), ALLOCATABLE :: args(:)
    CONTAINS
      PROCEDURE :: init => init_arg_reader
      PROCEDURE :: write_args
      GENERIC :: write(formatted) => write_args
  END TYPE

  CONTAINS
    SUBROUTINE init_arg_reader(self)
      CLASS(shell_argument_reader) :: self
      CHARACTER(LEN=100) :: arg_n
      INTEGER :: n

      self%arg_count = COMMAND_ARGUMENT_COUNT()
      ALLOCATE(self%args(self%arg_count))
      IF (self%arg_count > 0) THEN
        DO n = 1, self%arg_count
          CALL GET_COMMAND_ARGUMENT(n, arg_n)
          self%args(n) = trim(arg_n)
        END DO
      END IF
    END SUBROUTINE init_arg_reader

    SUBROUTINE write_args(dtv, unit, iotype, v_list, iostat, iomsg)
      CLASS(shell_argument_reader), INTENT(IN) :: dtv
      INTEGER, INTENT(IN) :: unit
      CHARACTER(LEN=*), INTENT(IN) :: iotype
      INTEGER, INTENT(IN) :: v_list(:)
      INTEGER, INTENT(OUT) :: iostat
      CHARACTER(LEN=*), INTENT(INOUT) :: iomsg
      INTEGER :: n

      IF (dtv%arg_count > 0) THEN
        DO n = 1, dtv%arg_count
          WRITE(unit, "(A)", iostat=iostat, iomsg=iomsg) dtv%args(n)%content
        END DO
      END IF

    END SUBROUTINE write_args
END MODULE FJEM_IO_ARGS
