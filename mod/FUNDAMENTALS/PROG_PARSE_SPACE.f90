module PROG_PARSE_SPACE
  use PROG_ERROR_MOD
  use PROG_CONSTANTS_MOD
  use PROG_TYPES_MOD
  implicit none
  private
  public space_file

  type :: space_file
    INTEGER :: space_length
    INTEGER :: space_width
    INTEGER :: space_height
    INTEGER :: unit_length
    contains
      PROCEDURE :: init => file_init
  end type
  contains
    subroutine file_init(this, file_name)
      CLASS(space_file) :: this
      CHARACTER(LEN=*) :: file_name
      TYPE(string) :: family, descriptor, values
      TYPE(list) :: statement
      CHARACTER(LEN=40) :: buffer(3)
      INTEGER :: io, o

      call statement%init(3)

      open(unit=o, file=file_name, action="read")
      do
        read(o, *, iostat=io) buffer(1), buffer(2), buffer(3)
        if (io /= 0) exit
        family = trim(buffer(1))
        descriptor = trim(buffer(2))
        values = trim(buffer(3))
        
        call statement%set(1, family)
        call statement%set(2, descriptor)
        call statement%set(3, values)
        call parse_statement(this, statement)
      end do
      close(o)
    end subroutine file_init

    subroutine parse_statement(this, statement)
      TYPE(space_file) :: this
      TYPE(list) :: statement
      TYPE(string) :: family

      family = statement%get(1)
      family = family%to_lower()

      SELECT CASE (family%get())
        CASE("space")
          call parse_space(this, statement)
        CASE DEFAULT
          call error("Undefined statement '" // family%get() // "'.")
      end SELECT
    end subroutine parse_statement

    subroutine parse_space(this, statement)
      TYPE(space_file) :: this
      TYPE(list) :: statement
      TYPE(string) :: descriptor, values

      values = statement%get(3)
      descriptor = statement%get(2)
      descriptor = descriptor%to_lower()

      SELECT CASE (descriptor%get())
        CASE("dimensions")
          write(*, *) values
        CASE("unit_length")
          write(*, *) values
        CASE DEFAULT
          call error("Undefined statement '" // descriptor%get() // "'.")
      end SELECT
    end subroutine parse_space
end module PROG_PARSE_SPACE
