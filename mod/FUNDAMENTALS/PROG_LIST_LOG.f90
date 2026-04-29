submodule (PROG_TYPES_MOD) PROG_LIST_LOG
  use PROG_ERROR_MOD
  implicit none 
  contains
    module procedure init_list
      TYPE(string) :: empty

      empty = ""

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
      this%list_obj(this%length) = str
    end procedure append_list

    module procedure write_list
      INTEGER :: length, i

      if(.not. allocated(dtv%list_obj)) call error("List is empty.")
      length = size(dtv%list_obj)

      do i = 1, length
        write(unit, "(A)", iostat=iostat, iomsg=iomsg) dtv%list_obj(i)
      end do
    end procedure write_list

    module procedure get_list
      val = this%list_obj(i)
    end procedure get_list

    module procedure set_list
      if (i > this%length) call error("Index is out of range.")
      this%list_obj(i) = val
    end procedure set_list
end submodule PROG_LIST_LOG
