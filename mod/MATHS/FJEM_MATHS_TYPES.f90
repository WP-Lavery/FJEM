module FJEM_MATHS_TYPES
  use FJEM_Base
  implicit none

  type :: space
    INTEGER :: length
    INTEGER, ALLOCATABLE :: dims(:)
    INTEGER, ALLOCATABLE :: strides(:)
    REAL(KIND=FJEMP), ALLOCATABLE :: obj(:)
    contains
      PROCEDURE :: init => space_init
      PROCEDURE :: get => space_get
      PROCEDURE :: set => space_set
  end type space

  interface
    module subroutine space_init(this, dims)
      CLASS(space) :: this
      INTEGER, INTENT(IN) :: dims(:)
    end subroutine space_init

    module function space_get(this, pos) result(res)
      CLASS(space), TARGET :: this
      INTEGER, INTENT(IN) :: pos(:)
      REAL(KIND=FJEMP) :: res
    end function space_get

    module subroutine space_set(this, pos, val)
      CLASS(space) :: this
      INTEGER, INTENT(IN) :: pos(:)
      REAL(KIND=FJEMP) :: val
    end subroutine space_set
  end interface
end module FJEM_MATHS_TYPES
