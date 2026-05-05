module FJEM_BASE_TYPES
  use FJEM_BASE_CONSTANTS
  implicit none
  
  type :: string
    CHARACTER(LEN=:), ALLOCATABLE :: str
    INTEGER :: length
    contains
      PROCEDURE :: get => get_string
      PROCEDURE :: to_lower => to_lower_string
      PROCEDURE :: to_upper => to_upper_string
      PROCEDURE :: cleave => cleave_string
      PROCEDURE :: read_string
      PROCEDURE :: write_string
     ! GENERIC :: read(formatted) => read_string
      GENERIC :: write(formatted) => write_string
  end type string

  type :: lexicon
    TYPE(string), ALLOCATABLE :: lexicon_obj(:)
    INTEGER :: length = 0
    contains
      PROCEDURE :: init => init_lexicon
      PROCEDURE :: append => append_lexicon
      PROCEDURE :: set => set_lexicon
      PROCEDURE :: get => get_lexicon
      PROCEDURE :: write_lexicon
      GENERIC :: write(formatted) => write_lexicon
  end type lexicon

  type :: list
    REAL(kind=dp), ALLOCATABLE :: list_obj(:)
    INTEGER :: length = 0
    contains
      PROCEDURE :: init => init_list
      PROCEDURE :: append => append_list
      PROCEDURE :: set => set_list
      PROCEDURE :: get => get_list
      PROCEDURE :: write_list
      GENERIC :: write(formatted) => write_list
  end type list
  
  interface
    module subroutine set_string(left, right)
      CLASS(string), INTENT(INOUT) :: left
      CHARACTER(LEN=*), INTENT(IN) :: right
    end subroutine set_string

    module function get_string(this) result(res)
      CLASS(string) :: this
      CHARACTER(LEN=:), ALLOCATABLE :: res
    end function get_string

    module subroutine read_string(dtv, unit, iotype, v_list, iostat, iomsg)
      CLASS(string), INTENT(INOUT) :: dtv
      INTEGER, INTENT(IN) :: unit
      CHARACTER(LEN=*), INTENT(IN) :: iotype
      INTEGER, INTENT(IN) :: v_list(:)
      INTEGER, INTENT(OUT) :: iostat
      CHARACTER(LEN=*), INTENT(INOUT) :: iomsg
    end subroutine read_string

    module subroutine write_string(dtv, unit, iotype, v_list, iostat, iomsg)
      CLASS(string), INTENT(IN) :: dtv
      INTEGER, INTENT(IN) :: unit
      CHARACTER(LEN=*), INTENT(IN) :: iotype
      INTEGER, INTENT(IN) :: v_list(:)
      INTEGER, INTENT(OUT) :: iostat
      CHARACTER(LEN=*), INTENT(INOUT) :: iomsg
    end subroutine write_string

    module function to_lower_string(this) result(val)
      CLASS(string), INTENT(INOUT) :: this
      CHARACTER(LEN=this%length) :: val
    end function to_lower_string
    
    module function to_upper_string(this) result(val)
      CLASS(string), INTENT(INOUT) :: this
      CHARACTER(LEN=this%length) :: val
    end function to_upper_string

    module function cleave_string(this, delimiter) result(split_arr)
      CLASS(string) :: this
      CHARACTER(LEN=*) :: delimiter
      TYPE(lexicon) :: split_arr
    end function cleave_string
  end interface

  interface
    module subroutine init_lexicon(this, i)
      CLASS(lexicon) :: this
      INTEGER :: i
    end subroutine init_lexicon

    module subroutine append_lexicon(this, str)
      CLASS(lexicon) :: this
      TYPE(string) :: str
    end subroutine append_lexicon

    module subroutine write_lexicon(dtv, unit, iotype, v_list, iostat, iomsg)
      CLASS(lexicon), INTENT(IN) :: dtv
      INTEGER, INTENT(IN) :: unit
      CHARACTER(LEN=*), INTENT(IN) :: iotype
      INTEGER, INTENT(IN) :: v_list(:)
      INTEGER, INTENT(OUT) :: iostat
      CHARACTER(LEN=*), INTENT(INOUT) :: iomsg
    end subroutine write_lexicon

    module function get_lexicon(this, i) result(val)
      CLASS(lexicon) :: this
      INTEGER :: i
      TYPE(string) :: val
    end function get_lexicon

    module subroutine set_lexicon(this, i, val)
      CLASS(lexicon) :: this
      INTEGER :: i
      TYPE(string) :: val
    end subroutine set_lexicon
  end interface

  interface
    module subroutine init_list(this, i)
      CLASS(list) :: this
      INTEGER :: i
    end subroutine init_list

    module subroutine append_list(this, num)
      CLASS(list) :: this
      REAL(KIND=dp) :: num
    end subroutine append_list

    module subroutine write_list(dtv, unit, iotype, v_list, iostat, iomsg)
      CLASS(list), INTENT(IN) :: dtv
      INTEGER, INTENT(IN) :: unit
      CHARACTER(LEN=*), INTENT(IN) :: iotype
      INTEGER, INTENT(IN) :: v_list(:)
      INTEGER, INTENT(OUT) :: iostat
      CHARACTER(LEN=*), INTENT(INOUT) :: iomsg
    end subroutine write_list

    module function get_list(this, i) result(val)
      CLASS(list) :: this
      INTEGER :: i
      REAL(KIND=dp) :: val
    end function get_list

    module subroutine set_list(this, i, val)
      CLASS(list) :: this
      INTEGER, OPTIONAL :: i
      REAL(KIND=dp) :: val
    end subroutine set_list

    module subroutine set_list_all(this, right)
      CLASS(list), INTENT(INOUT) :: this
      REAL(KIND=dp), INTENT(IN) :: right
    end subroutine set_list_all
  end interface
  
  interface assignment(=)
    module procedure set_string
    module procedure set_list_all
  end interface
end module FJEM_BASE_TYPES
