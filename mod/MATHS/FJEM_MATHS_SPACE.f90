submodule (FJEM_MATHS_TYPES) FJEM_MATHS_SPACE
  use FJEM_Base
  implicit none
  contains
    module procedure space_add
      TYPE(space) :: buffer
      INTEGER :: dims

      if (present(val)) then
        write(*, *) size(val)
        dims = i + size(val) - 1
      else
        dims = i
      end if

      if (.not. allocated(this%obj)) then
        this%order = dims
        allocate(this%obj(dims))
      else if (i > this%order) then
        allocate(buffer%obj(dims))
        buffer%obj(1:this%order) = this%obj
        deallocate(this%obj)
        this%order = dims
        allocate(this%obj(dims))
        this%obj = buffer%obj
      end if

      if (present(val)) then
        this%obj(i:dims) = val
      end if
    end procedure space_add

    module procedure space_get
      res => this%obj(i)
    end procedure space_get

end submodule FJEM_MATHS_SPACE
