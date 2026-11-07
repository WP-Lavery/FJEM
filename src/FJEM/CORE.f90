MODULE FJEM_CORE
  USE FJEM_CORE_ERROR
  USE FJEM_CORE_CONSTANTS
  USE FJEM_CORE_TYPES
  IMPLICIT NONE
  PRIVATE

  !- Re-Export FJEM_CORE_ERROR exports -!
  PUBLIC :: throw_error, throw_warning

  !- Re-Export FJEM_CORE_CONSTANTS exports -!
  PUBLIC :: FJEM_PRECISION

  !- Re-Export FJEM_CORE_TYPES exports -!
  public :: FJEM_TYPE_WRAPPER
  public :: String, concat, ASSIGNMENT(=)
  public :: int_to_char, real_to_char, stringify

  !- Export functions defined at top level of CORE -!
  public :: typeof, typeName

  CONTAINS
    FUNCTION typeof(var) RESULT(res)
      CLASS(*) :: var
      INTEGER :: res

      SELECT TYPE (var)
        !- FORTRAN primative types are labelled 1-5 as follows -!
        TYPE IS (INTEGER);                           res = 1
        TYPE IS (REAL(KIND=FJEM_PRECISION));         res = 2
        TYPE IS (COMPLEX(KIND=FJEM_PRECISION));      res = 3
        TYPE IS (LOGICAL);                           res = 4
        TYPE IS (CHARACTER(*));                      res = 5
        !- FJEM CORE types are labelled 101-1xx -!
      CLASS IS (FJEM_TYPE_WRAPPER);                  res = var%type_id()
        !- TypeError will return 0 -!
        CLASS DEFAULT;                               res = 0
      END SELECT
    END FUNCTION typeof

    FUNCTION typeName(var) RESULT(res)
      CLASS(*) :: var
      CHARACTER(LEN=:), ALLOCATABLE :: res

      SELECT TYPE (var)
        !- FORTRAN primative types are labelled 1-5 as follows -!
        TYPE IS (INTEGER);                           res = "Integer"
        TYPE IS (REAL(KIND=FJEM_PRECISION));         res = "Real"
        TYPE IS (COMPLEX(KIND=FJEM_PRECISION));      res = "Complex"
        TYPE IS (LOGICAL);                           res = "Logical"
        TYPE IS (CHARACTER(*));                      res = "Character"
        !- FJEM CORE types are labelled 101-1xx -!
      CLASS IS (FJEM_TYPE_WRAPPER);                  res = var%type_name()
        !- TypeError will return 0 -!
        CLASS DEFAULT;                               res = "None"
      END SELECT
    END FUNCTION typeName
END MODULE FJEM_CORE
