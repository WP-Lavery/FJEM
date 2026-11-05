PROGRAM main
  USE FJEM
  IMPLICIT NONE
  
  INTEGER, PARAMETER :: FJEMP = FJEM_PRECISION
  TYPE(KeyValuePair) :: kvp_test
  kvp_test = KeyValuePair("Test Key", INT(200))
  print *, kvp_test
END PROGRAM main
