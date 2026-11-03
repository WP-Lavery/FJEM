PROGRAM main
  USE FJEM
  IMPLICIT NONE

  TYPE(wavefront) :: obj
  call obj%read("./src/FJEM.f90")
END PROGRAM main
