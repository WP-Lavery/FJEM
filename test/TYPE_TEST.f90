PROGRAM TYPE_TEST
  USE FJEM
  IMPLICIT NONE
  INTEGER, PARAMETER :: FJEMP = SELECTED_REAL_KIND(15, 300)

  !- TESTING typeof FUNCTION -!

  !- Test native primatives (Not really necessary) -!
  IF (typeof(1) /= 1) THEN
    CALL throw_error("Expected TypeOf Integer to be 1")
  END IF
  IF (typeof(3.14_FJEMP) /= 2) THEN
    CALL throw_error("Expected TypeOf Real to be 2")
  END IF
  IF (typeof(CMPLX(1.0, 1.0, KIND=FJEMP)) /= 3) THEN
    CALL throw_error("Expected TypeOf Complex to be 3")
  END IF
  IF (typeof(.true.) /= 4) THEN
    CALL throw_error("Expected TypeOf Logical to be 4")
  END IF
  IF (typeof("Hello World") /= 5) THEN
    CALL throw_error("Expected TypeOf Character to be 5")
  END IF
  
  !- Test CORE derived types -!
  IF (typeof(String("Hello User")) /= 101) THEN
    CALL throw_error("Expected TypeOf String to be 101")
  END IF

  !- Test STRUCTS derived types -!
  IF (typeof(KeyValuePair("Test", .true.)) /= 201) THEN
    CALL throw_error("Expected TypeOf KeyValuePair to be 201")
  END IF

  print *, "Function 'typeof' behaving properly"
  
  !- TESTING typeName FUNCTION -!

  !- Test native primatives (Not really necessary) -!
  IF (typeName(1) /= "Integer") THEN
    CALL throw_error("Expected TypeName 'Integer'")
  END IF
  IF (typeName(3.14_FJEMP) /= "Real") THEN
    CALL throw_error("Expected TypeName 'Real'")
  END IF
  IF (typeName(CMPLX(1.0, 1.0, KIND=FJEMP)) /= "Complex") THEN
    CALL throw_error("Expected TypeName 'Complex'")
  END IF
  IF (typeName(.true.) /= "Logical") THEN
    CALL throw_error("Expected TypeName 'Logical'")
  END IF
  IF (typeName("Hello World") /= "Character") THEN
    CALL throw_error("Expected TypeName 'Character'")
  END IF
  
  !- Test CORE derived types -!
  IF (typeName(String("Hello User")) /= "String") THEN
    CALL throw_error("Expected TypeName 'String'")
  END IF

  !- Test STRUCTS derived types -!
  IF (typeName(KeyValuePair("Test", .true.)) /= "KeyValuePair") THEN
    CALL throw_error("Expected TypeName 'KeyValuePair'")
  END IF
  
  print *, "Function 'typeName' behaving properly"

END PROGRAM TYPE_TEST
