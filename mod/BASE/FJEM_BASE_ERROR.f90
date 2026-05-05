module FJEM_BASE_ERROR
  implicit none
  private
  public error, warning

  CHARACTER(LEN=*), PARAMETER :: ESC = achar(27)
  contains
    subroutine error(msg)
      CHARACTER(LEN=*) :: msg
      write(*, "(A)", ADVANCE="NO") ESC // "[31m" // "ERROR: " // msg
      write(*, "(A)") ESC // "[0m"
      STOP
    end subroutine error

    subroutine warning(msg)
      CHARACTER(LEN=*) :: msg
      write(*, "(A)", ADVANCE="NO") ESC // "[33m" // "WARNING: " // msg
      write(*, "(A)") ESC // "[0m"
    end subroutine warning
end module FJEM_BASE_ERROR
