SUBMODULE (FJEM_STRUCTS_TUPLES) FJEM_STRUCTS_TUPLES_KVP
  USE FJEM_CORE
  IMPLICIT NONE
  CONTAINS
    MODULE PROCEDURE init_kvp
      res%type_id = 201
      ALLOCATE(res%key_data, source=key_data)
      ALLOCATE(res%value_data, source=value_data)
      res%key_type = typeof(key_data)
      res%value_type = typeof(value_data)
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
      TYPE(String) :: key_string, value_string, out_string      

      !- Checks key-value types and quotes strings for clarity -!
      IF (dtv%key_type == 5) THEN
        key_string = concat([String("'"), stringify(dtv%key_data), String("'")])
      ELSE
        key_string = stringify(dtv%key_data)
      END IF

      IF (dtv%value_type == 5) THEN
        value_string = concat([String("'"), stringify(dtv%value_data), String("'")])
      ELSE
        value_string = stringify(dtv%value_data)
      END IF
      
      out_string = concat([String("{ "), &
        key_string, &
        String(": "), &
        value_string, &
        String(" }")])

      WRITE(unit, "(A)", IOSTAT=iostat, IOMSG=iomsg) out_string%content
    END PROCEDURE write_kvp
END SUBMODULE FJEM_STRUCTS_TUPLES_KVP
