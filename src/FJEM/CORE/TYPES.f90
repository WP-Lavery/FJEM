MODULE FJEM_CORE_TYPES
  USE FJEM_CORE_ERROR
  USE FJEM_CORE_CONSTANTS
  IMPLICIT NONE
  PRIVATE
  PUBLIC String, concat, ASSIGNMENT(=)

  TYPE :: String
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

  INTERFACE String
    MODULE PROCEDURE set_string
  END INTERFACE String

  INTERFACE concat
    MODULE PROCEDURE concat_strings
  END INTERFACE concat

  INTERFACE
    MODULE FUNCTION set_string(char_in) RESULT(res)
      CHARACTER(LEN=*), INTENT(IN) :: char_in
      TYPE(String) :: res
    END FUNCTION set_string

    MODULE FUNCTION get_string(self) RESULT(res)
      CLASS(String) :: self
      CHARACTER(LEN=:), ALLOCATABLE :: res
    END FUNCTION get_string
    
    MODULE SUBROUTINE write_string(dtv, unit, iotype, v_list, iostat, iomsg)
      CLASS(String), INTENT(IN) :: dtv
      INTEGER, INTENT(IN) :: unit
      CHARACTER(LEN=*), INTENT(IN) :: iotype
      INTEGER, INTENT(IN) :: v_list(:)
      INTEGER, INTENT(OUT) :: iostat
      CHARACTER(LEN=*), INTENT(INOUT) :: iomsg
    END SUBROUTINE write_string
    
    MODULE SUBROUTINE assign_char_to_string(lhs, rhs)
      TYPE(String), INTENT(OUT) :: lhs
      CHARACTER(LEN=*), INTENT(IN) :: rhs
    END SUBROUTINE assign_char_to_string
  END INTERFACE

  PUBLIC :: int_to_char, real_to_char, stringify
  CONTAINS
    FUNCTION concat_strings(strings) RESULT(res)
      TYPE(String), INTENT(IN) :: strings(:)
      TYPE(String) :: res
      INTEGER :: n

      res = String("")

      IF (SIZE(strings) > 0) THEN; res = strings(1); END IF

      IF (SIZE(strings) > 1) THEN
        DO n = 2, SIZE(strings)
          res = res%content // strings(n)%content
        END DO
      END IF
    END FUNCTION

    FUNCTION int_to_char(num) RESULT(res)
      INTEGER, INTENT(IN) :: num
      CHARACTER(LEN=RANGE(num) + 2) :: buffer
      CHARACTER(LEN=:), ALLOCATABLE :: res

      WRITE(buffer, "(I0)") num
      res = TRIM(ADJUSTL(buffer))
    END FUNCTION int_to_char

    FUNCTION real_to_char(num) RESULT(res)
      REAL(KIND=FJEM_PRECISION), INTENT(IN) :: num
      CHARACTER(LEN=RANGE(num) + 2) :: buffer
      CHARACTER(LEN=:), ALLOCATABLE :: res

      WRITE(buffer, "(G0)") num
      res = TRIM(ADJUSTL(buffer))
    END FUNCTION real_to_char

    FUNCTION stringify(val) RESULT(res)
      CLASS(*), INTENT(IN) :: val
      TYPE(String) :: res

      SELECT TYPE (data => val)
        TYPE IS (String); res = data
        TYPE IS (CHARACTER(*)); res = data
        TYPE IS (INTEGER); res = int_to_char(data)
        TYPE IS (REAL(KIND=FJEM_PRECISION)); res = real_to_char(data)
        CLASS DEFAULT; call throw_error("Could not stringify, unrecognised type")
      END SELECT
    END FUNCTION stringify
END MODULE FJEM_CORE_TYPES
