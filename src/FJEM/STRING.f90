MODULE FJEM_STRING
  USE FJEM_ERROR
  USE FJEM_CONSTANTS
  IMPLICIT NONE
  PRIVATE
  PUBLIC string, ASSIGNMENT(=)

  TYPE :: string
    CHARACTER(LEN=:), ALLOCATABLE :: content
    INTEGER :: length
    CONTAINS
      PROCEDURE :: get => get_string
      PROCEDURE :: write_string
      GENERIC :: write(formatted) => write_string
  END TYPE

  INTERFACE ASSIGNMENT(=)
    MODULE PROCEDURE assign_char_to_string
  END INTERFACE ASSIGNMENT(=)

  CONTAINS
    FUNCTION get_string(self) result(res)
      CLASS(string) :: self
      CHARACTER(LEN=:), ALLOCATABLE :: res

      res = ADJUSTL(self%content)
    END FUNCTION get_string

    SUBROUTINE write_string(dtv, unit, iotype, v_list, iostat, iomsg)
      CLASS(string), INTENT(IN) :: dtv
      INTEGER, INTENT(IN) :: unit
      CHARACTER(LEN=*), INTENT(IN) :: iotype
      INTEGER, INTENT(IN) :: v_list(:)
      INTEGER, INTENT(OUT) :: iostat
      CHARACTER(LEN=*), INTENT(INOUT) :: iomsg

      WRITE(unit, "(A)", iostat=iostat, iomsg=iomsg) dtv%content 
    END SUBROUTINE write_string

    SUBROUTINE assign_char_to_string(lhs, rhs)
      TYPE(string), INTENT(OUT) :: lhs
      CHARACTER(LEN=*), INTENT(IN) :: rhs

      lhs%content = rhs
      lhs%length = LEN(rhs)
    END SUBROUTINE assign_char_to_string
END MODULE FJEM_STRING
