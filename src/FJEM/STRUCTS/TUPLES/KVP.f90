SUBMODULE (FJEM_STRUCTS_TUPLES) FJEM_STRUCTS_TUPLES_KVP
  USE FJEM_CORE
  IMPLICIT NONE
  CONTAINS
    MODULE PROCEDURE init_kvp
      ALLOCATE(res%key_data, source=key_data)
      ALLOCATE(res%value_data, source=value_data)
    END PROCEDURE init_kvp

    MODULE PROCEDURE get_key
      SELECT TYPE (src => self%key_data)
        TYPE IS (INTEGER)
          SELECT TYPE(dest => res)
            TYPE IS (INTEGER)
              dest = src
            CLASS DEFAULT
              call throw_error("Type mismatch in 'KeyValuePair%key()'")
          END SELECT
        TYPE IS (CHARACTER(*))
          SELECT TYPE(dest => res)
            TYPE IS (CHARACTER(*))
              dest = src
            CLASS DEFAULT
              call throw_error("Type mismatch in 'KeyValuePair%key()'")
          END SELECT
        CLASS DEFAULT; call throw_error("Type mismatch in 'KeyValuePair%key()'")
      END SELECT
    END PROCEDURE get_key

    MODULE PROCEDURE get_value
      SELECT TYPE (src => self%value_data)
        TYPE IS (INTEGER)
          SELECT TYPE(dest => res)
            TYPE IS (INTEGER)
              dest = src
            CLASS DEFAULT
              call throw_error("Type mismatch in 'KeyValuePair%value()'")
          END SELECT
        TYPE IS (CHARACTER(*))
          SELECT TYPE(dest => res)
            TYPE IS (CHARACTER(*))
              dest = src
            CLASS DEFAULT
              call throw_error("Type mismatch in 'KeyValuePair%value()'")
          END SELECT
        CLASS DEFAULT; call throw_error("Type mismatch in 'KeyValuePair%value()'")
      END SELECT
    END PROCEDURE get_value

    MODULE PROCEDURE write_kvp
      TYPE(String) :: out_string
      
      out_string = concat([String("{ "), &
        stringify(dtv%key_data), &
        String(": "), &
        stringify(dtv%value_data), &
        String(" }")])

      WRITE(unit, "(A)", IOSTAT=iostat, IOMSG=iomsg) out_string%content
    END PROCEDURE write_kvp
END SUBMODULE FJEM_STRUCTS_TUPLES_KVP
