submodule (FJEM_MATHS_TYPES) FJEM_MATHS_SPACE
  use FJEM_Base
  implicit none
  contains
    module procedure space_init
      INTEGER :: mgn = 1
      INTEGER :: i
      
      allocate(this%dims(size(dims)))
      
      do i = 1, SIZE(dims)
        this%dims(i) = mgn
        mgn = mgn * dims(i)
      end do

      allocate(this%obj(mgn))
    end procedure space_init

    module procedure space_get
      INTEGER :: loc = pos(1)
      INTEGER :: i

      if (size(pos) > size(this%dims)) call ERROR("Coordinates exceed dimensions of space")

      if (size(pos) > 1) then
        do i = 2, size(pos)
          loc = loc + ((pos(i)-1)*this%strides(i))
        end do
      end if

      res = this%obj(val)
    end procedure space_get

    module procedure space_set
      INTEGER :: loc = pos(1)
      INTEGER :: i
        
      if (size(pos) > size(this%dims)) call ERROR("Coordinates exceed dimensions of space")
      
      if (size(pos) > 1) then
        do i = 2, size(pos)
          loc = loc + ((pos(i)-1)*this%strides(i))
        end do
      end if

      this%obj(val) = val
    end procedure space_set

end submodule FJEM_MATHS_SPACE
