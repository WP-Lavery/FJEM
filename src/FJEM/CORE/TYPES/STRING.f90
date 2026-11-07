SUBMODULE (FJEM_CORE_TYPES) FJEM_CORE_TYPES_STRING
  USE FJEM_CORE_ERROR
  USE FJEM_CORE_CONSTANTS
  IMPLICIT NONE
  CONTAINS
    MODULE PROCEDURE set_string
      res%type_id = 101
      res%content = char_in
      res%length = LEN(char_in)
    END PROCEDURE set_string

    MODULE PROCEDURE get_string
      res = ADJUSTL(self%content)
    END PROCEDURE get_string

    MODULE PROCEDURE write_string
      WRITE(unit, "(A)", iostat=iostat, iomsg=iomsg) dtv%content
    END PROCEDURE write_string

    MODULE PROCEDURE assign_char_to_string
      lhs%type_id = 101
      lhs%content = rhs
      lhs%length = LEN(rhs)
    END PROCEDURE assign_char_to_string
END SUBMODULE FJEM_CORE_TYPES_STRING
