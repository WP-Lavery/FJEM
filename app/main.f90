PROGRAM main
  USE FJEM
  IMPLICIT NONE
  
  INTEGER, PARAMETER :: FJEMP = FJEM_PRECISION
  TYPE(KeyValuePair) :: kvp_test
  kvp_test = KeyValuePair("Test Key", -2.3_FJEMP)
  print *, kvp_test
  print *, kvp_test%key_type
  print *, kvp_test%value_type
END PROGRAM main
