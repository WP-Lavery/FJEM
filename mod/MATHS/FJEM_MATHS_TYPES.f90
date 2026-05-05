module FJEM_MATHS_TYPES
  use FJEM_Base
  implicit none

  type :: space
    INTEGER :: order = 0
    TYPE(list), ALLOCATABLE :: obj(:)
    contains
      PROCEDURE :: add => space_add
      PROCEDURE :: get => space_get
  end type space

  interface
    module subroutine space_add(this, i, val)
      CLASS(space) :: this
      INTEGER :: i
      TYPE(list), ALLOCATABLE, OPTIONAL :: val(:)
    end subroutine space_add

    module function space_get(this, i) result(res)
      CLASS(space), TARGET :: this
      INTEGER :: i
      TYPE(list), POINTER :: res
    end function space_get
  end interface
end module FJEM_MATHS_TYPES
