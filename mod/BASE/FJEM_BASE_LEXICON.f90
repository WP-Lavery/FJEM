submodule (FJEM_BASE_TYPES) FJEM_BASE_LEXICON
  use FJEM_BASE_ERROR
  implicit none 
  contains
    module procedure init_lexicon
      TYPE(string) :: empty

      empty = ""

      if (allocated(this%lex)) call error("Lexicon is already initialised.")
      allocate(this%lex(i))
      this%lex = empty
      this%length = i
    end procedure init_lexicon

    module procedure append_lexicon
      TYPE(lexicon) :: buffer

      buffer=this

      if (allocated(this%lex)) deallocate(this%lex)
      this%length=this%length+1
      allocate(this%lex(this%length))
      this%lex(1:this%length-1) = buffer%lex(:)
      this%lex(this%length) = str
    end procedure append_lexicon

    module procedure write_lexicon
      INTEGER :: length, i

      if(.not. allocated(dtv%lex)) call error("Lexicon is empty.")
      length = size(dtv%lex)

      do i = 1, length
        write(unit, "(A)", iostat=iostat, iomsg=iomsg) dtv%lex(i)
      end do
    end procedure write_lexicon

    module procedure get_lexicon
      val = this%lex(i)
    end procedure get_lexicon

    module procedure set_lexicon
      if (i > this%length) call error("Index is out of range.")
      this%lex(i) = val
    end procedure set_lexicon

    module procedure set_lexicon_all
      this%lex = right
    end procedure set_lexicon_all
end submodule FJEM_BASE_LEXICON
