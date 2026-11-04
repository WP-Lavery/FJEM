MODULE FJEM
  USE FJEM_CONSTANTS
  USE FJEM_ERROR
  USE FJEM_MATHS
  USE FJEM_IO
  USE FJEM_STRING
  IMPLICIT NONE
  PRIVATE

  ! Re-Export FJEM_CONSTANTS exports. !
  public :: FJEM_PRECISION

  ! Re-Export FJEM_ERROR exports. !
  public :: throw_error, throw_warning

  ! Re-Export FJEM_MATHS exports. !
  public :: pi_, e_

  ! Re-Export FJEM_IO exports. !
  public :: file_exists
  public :: shell_argument_reader
  public :: wavefront

  ! Re-Export FJEM_STRING exports. !
  public :: string, ASSIGNMENT(=)
END MODULE FJEM
