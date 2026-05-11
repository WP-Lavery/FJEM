submodule (FJEM_BASE_TYPES) FJEM_BASE_LIST
  use FJEM_BASE_ERROR
  implicit none 
  contains
    module procedure init_list
      REAL(KIND=FJEMP) :: empty

      empty = 0.0_FJEMP

      if (allocated(this%lst)) call error("List is already initialised.")
      allocate(this%lst(i))
      this%lst = empty
      this%length = i
    end procedure init_list

    module procedure append_list
      TYPE(list) :: buffer

      buffer=this

      if (allocated(this%lst)) deallocate(this%lst)
      this%length=this%length+1
      allocate(this%lst(this%length))
      this%lst(1:this%length-1) = buffer%lst(:)
      this%lst(this%length) = num
    end procedure append_list

    module procedure write_list
      INTEGER :: length, i

      if(.not. allocated(dtv%lst)) then
        call warning("List is empty.")
        return
      end if
      length = size(dtv%lst)

      do i = 1, length
        write(unit, *, iostat=iostat, iomsg=iomsg) dtv%lst(i)
      end do
    end procedure write_list

    module procedure get_list
      val = this%lst(i)
    end procedure get_list

    module procedure set_list
      if (present(i)) then
        if (i > this%length) call error("Index is out of range.")
        this%lst(i) = val
      else
        this%lst = val
      end if
    end procedure set_list

    module procedure set_list_all
      this%lst = right
    end procedure set_list_all
end submodule FJEM_BASE_LIST
