MODULE FJEM_CORE
  USE FJEM_CORE_ERROR
  USE FJEM_CORE_CONSTANTS
  USE FJEM_CORE_TYPES
  IMPLICIT NONE
  PRIVATE

  PUBLIC :: throw_error, throw_warning

  PUBLIC :: FJEM_PRECISION

  PUBLIC :: String, concat, ASSIGNMENT(=)
  public :: int_to_char, real_to_char, stringify
END MODULE FJEM_CORE
