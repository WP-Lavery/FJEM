MODULE FJEM
  USE FJEM_CORE
  USE FJEM_MATHS
  USE FJEM_IO
  IMPLICIT NONE
  PRIVATE

  ! Re-Export FJEM_CORE exports. !
  public :: throw_error, throw_warning

  public :: FJEM_PRECISION

  public :: string, ASSIGNMENT(=)

  ! Re-Export FJEM_MATHS exports. !
  public :: pi_, e_

  ! Re-Export FJEM_IO exports. !
  public :: file_exists
  public :: shell_argument_reader
  public :: wavefront
END MODULE FJEM
