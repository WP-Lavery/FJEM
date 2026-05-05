submodule (FJEM_BASE_TYPES) FJEM_BASE_LEXICON
  use FJEM_BASE_ERROR
  implicit none 
  contains
    module procedure init_lexicon
      TYPE(string) :: empty

      empty = ""

      if (allocated(this%lexicon_obj)) call error("Lexicon is already initialised.")
      allocate(this%lexicon_obj(i))
      this%lexicon_obj = empty
      this%length = i
    end procedure init_lexicon

    module procedure append_lexicon
      TYPE(lexicon) :: buffer

      buffer=this

      if (allocated(this%lexicon_obj)) deallocate(this%lexicon_obj)
      this%length=this%length+1
      allocate(this%lexicon_obj(this%length))
      this%lexicon_obj(1:this%length-1) = buffer%lexicon_obj(:)
      this%lexicon_obj(this%length) = str
    end procedure append_lexicon

    module procedure write_lexicon
      INTEGER :: length, i

      if(.not. allocated(dtv%lexicon_obj)) call error("Lexicon is empty.")
      length = size(dtv%lexicon_obj)

      do i = 1, length
        write(unit, "(A)", iostat=iostat, iomsg=iomsg) dtv%lexicon_obj(i)
      end do
    end procedure write_lexicon

    module procedure get_lexicon
      val = this%lexicon_obj(i)
    end procedure get_lexicon

    module procedure set_lexicon
      if (i > this%length) call error("Index is out of range.")
      this%lexicon_obj(i) = val
    end procedure set_lexicon
end submodule FJEM_BASE_LEXICON
