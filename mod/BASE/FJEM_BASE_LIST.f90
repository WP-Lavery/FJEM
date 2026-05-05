submodule (FJEM_BASE_TYPES) FJEM_BASE_LIST
  use FJEM_BASE_ERROR
  implicit none 
  contains
    module procedure init_list
      REAL(KIND=dp) :: empty

      empty = 0.0_dp

      if (allocated(this%list_obj)) call error("List is already initialised.")
      allocate(this%list_obj(i))
      this%list_obj = empty
      this%length = i
    end procedure init_list

    module procedure append_list
      TYPE(list) :: buffer

      buffer=this

      if (allocated(this%list_obj)) deallocate(this%list_obj)
      this%length=this%length+1
      allocate(this%list_obj(this%length))
      this%list_obj(1:this%length-1) = buffer%list_obj(:)
      this%list_obj(this%length) = num
    end procedure append_list

    module procedure write_list
      INTEGER :: length, i

      if(.not. allocated(dtv%list_obj)) then
        call warning("List is empty.")
        return
      end if
      length = size(dtv%list_obj)

      do i = 1, length
        write(unit, *, iostat=iostat, iomsg=iomsg) dtv%list_obj(i)
      end do
    end procedure write_list

    module procedure get_list
      val = this%list_obj(i)
    end procedure get_list

    module procedure set_list
      if (present(i)) then
        if (i > this%length) call error("Index is out of range.")
        this%list_obj(i) = val
      else
        this%list_obj = val
      end if
    end procedure set_list

    module procedure set_list_all
      this%list_obj = right
    end procedure set_list_all
end submodule FJEM_BASE_LIST
