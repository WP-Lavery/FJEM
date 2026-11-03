MODULE FJEM
  USE FJEM_CONSTANTS
  USE FJEM_ERROR
  USE FJEM_MATHS
  IMPLICIT NONE
  PRIVATE

  ! Re-Export FJEM_CONSTANTS exports. !
  public :: FJEM_PRECISION

  ! Re-Export FJEM_ERROR exports. !
  public :: throw_error, throw_warning

  ! Re-Export FJEM_MATHS exports. !
  public :: pi_, e_
END MODULE FJEM
