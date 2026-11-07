MODULE FJEM
  USE FJEM_CORE
  USE FJEM_MATHS
  USE FJEM_IO
  USE FJEM_STRUCTS
  IMPLICIT NONE
  PRIVATE

  ! Re-Export FJEM_CORE exports. !
  public :: throw_error, throw_warning

  public :: FJEM_PRECISION

  public :: String, concat, ASSIGNMENT(=)
  public :: int_to_char, real_to_char, stringify
  public :: typeof

  ! Re-Export FJEM_MATHS exports. !
  public :: pi_, e_

  ! Re-Export FJEM_IO exports. !
  public :: file_exists
  public :: shell_argument_reader
  public :: wavefront

  ! Re-Export FJEM_STRUCTS exports. !
  public :: KeyValuePair
END MODULE FJEM
