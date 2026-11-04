PROGRAM main
  USE FJEM
  IMPLICIT NONE

  TYPE(shell_argument_reader) :: args
  call args%init()
  print *, args%arg_count
  print *, args
END PROGRAM main
