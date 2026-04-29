submodule (PROG_TYPES_MOD) PROG_STRING_LOG
  use PROG_ERROR_MOD
  implicit none
  contains
    module procedure set_string
      left%str = right
      left%length = len(right)
    end procedure set_string

    module procedure get_string
      res = ADJUSTL(this%str)
    end procedure get_string

    module procedure read_string
      CHARACTER(LEN=1024) :: buffer
      INTEGER :: length
      
      do
        read(unit, "(A)", advance="no", iostat=iostat, iomsg=iomsg, size=length) buffer
        dtv%str = dtv%str // buffer(1:length)
        if (is_iostat_eor(iostat)) exit
        if (iostat /= 0) call error(iomsg)
      end do
    end procedure read_string

    module procedure write_string
      write(unit, "(A)", iostat=iostat, iomsg=iomsg) dtv%str
    end procedure write_string

    module procedure to_lower_string
      INTEGER :: i, ascii
      
      do i = 1, this%length
        ascii = iachar(this%str(i:i))
        if (ascii >= iachar("A") .and. ascii <= iachar("Z")) then
          val(i:i) = achar(ascii + 32)
        else
          val(i:i) = this%str(i:i)
        end if
      end do
    end procedure to_lower_string
    
    module procedure to_upper_string
      INTEGER :: i, ascii
      
      do i = 1, this%length
        ascii = iachar(this%str(i:i))
        if (ascii >= iachar("a") .and. ascii <= iachar("z")) then
          val(i:i) = achar(ascii - 32)
        else
          val(i:i) = this%str(i:i)
        end if
      end do
    end procedure to_upper_string

    module procedure cleave_string
      INTEGER :: i
      TYPE(string) :: buffer

      buffer = ""

      do i = 1, this%length
        if (this%str(i:i) == delimiter) then
          call split_arr%append(buffer)
          buffer = ""
        else
          buffer = buffer%get() // this%str(i:i)
        end if
      end do
    end procedure cleave_string
end submodule PROG_STRING_LOG
