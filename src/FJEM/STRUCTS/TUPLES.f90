MODULE FJEM_STRUCTS_TUPLES
  USE FJEM_CORE
  IMPLICIT NONE
  PRIVATE
  PUBLIC KeyValuePair

  TYPE :: KeyValuePair
    PRIVATE
    CLASS(*), ALLOCATABLE :: key_data
    CLASS(*), ALLOCATABLE :: value_data
    CONTAINS
      PROCEDURE :: key => get_key
      PROCEDURE :: value => get_value
      PROCEDURE :: write_kvp
      GENERIC :: write(formatted) => write_kvp
  END TYPE KeyValuePair

  INTERFACE KeyValuePair
    MODULE PROCEDURE init_kvp
  END INTERFACE KeyValuePair

  INTERFACE
    MODULE FUNCTION init_kvp(key_data, value_data) RESULT(res)
      TYPE(KeyValuePair) :: res
      CLASS(*), INTENT(IN) :: key_data, value_data
    END FUNCTION init_kvp

    MODULE SUBROUTINE get_key(self, res)
      CLASS(KeyValuePair), INTENT(IN) :: self
      CLASS(*), INTENT(OUT) :: res
    END SUBROUTINE get_key

    MODULE SUBROUTINE get_value(self, res)
      CLASS(KeyValuePair), INTENT(IN) :: self
      CLASS(*), INTENT(OUT) :: res
    END SUBROUTINE get_value

    MODULE SUBROUTINE write_kvp(dtv, unit, iotype, v_list, iostat, iomsg)
      CLASS(KeyValuePair), INTENT(IN) :: dtv
      INTEGER, INTENT(IN) :: unit
      CHARACTER(LEN=*), INTENT(IN) :: iotype
      INTEGER, INTENT(IN) :: v_list(:)
      INTEGER, INTENT(OUT) :: iostat
      CHARACTER(LEN=*), INTENT(INOUT) :: iomsg
    END SUBROUTINE write_kvp
  END INTERFACE
END MODULE FJEM_STRUCTS_TUPLES
