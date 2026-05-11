## FJEM Base - Version 0.0.1

#### New Features:
- Precision Constant:
  - The constant FJEMP is used by all REAL and COMPLEX FJEM variables. FJEMP is defined as SELECTED_REAL_KIND(15, 300)
- Error Handling:
  - A module containing 2 error handling methods has been added (see below in "methods").
- Derived Types - The following derived types have been introduced:
  - "string" - Dynamic length "CHARACTER" type
  - "list" - Dynamic length array of type "REAL"
  - "lexicon" - Dynamic length array of derived type "string"

##### Methods:
- SUBROUTINE ERROR(CHARACTER(\*) msg) - Throws an error with message "msg", then stops the program
- SUBROUTINE WARNING(CHARACTER(\*) msg) - Throws a warning with message "msg", but doesn't stop the program

##### Derived Types:
- string:
  - Members:
    - CHARACTER(:<zero-width space>) str
    - INTEGER length
  - Type-Bound Procedures:
    - FUNCTION string%get(): Returns the str member
    - FUNCTION string%to_lower(): Returns the str member in lower case
    - FUNCTION string%to_upper(): Returns the str member in upper case
    - FUNCTION string%cleave(CHARACTER(\*) delimiter): Returns a TYPE(lexicon) containing the string split up by the delimiter
  - Generic Procedures:
    - assignment(=): Assigns a type CHARACTER(\*) to str member
    - write: Uses write method with str member
- list:
  - Members:
    - REAL(FJEMP) lst(:<zero-width space>)
    - INTEGER length
  - Type-Bound Procedures:
    - SUBROUTINE list%init(INTEGER i): Allocates the lst member to length i, and stores i in the length member
    - SUBROUTINE list%append(REAL(FJEMP) num): Extends the lst member by 1, increases the length member by 1, and sets the last value to num
    - FUNCTION list%get(INTEGER i): Returns the REAL(FJEMP) value of lst member at index i
    - SUBROUTINE list%set(INTEGER i, REAL(FJEMP) val): Assigns val to the index i of the lst member
  - Generic Procedures:
    - assignment(=): Assigns a type REAL(FJEMP) to all values in lst member
    - write: Uses write method on all elements of lst member
- lexicon
  - Members:
    - TYPE(string) lex(:<zero-width space>)
    - INTEGER length
  - Type-Bound Procedures:
    - SUBROUTINE list%init(INTEGER i): Allocates the lex member to length i, and stores i in the length member
    - SUBROUTINE list%append(TYPE(string) str): Extends the lex member by 1, increases the length member by 1, and sets the last value to str
    - FUNCTION list%get(INTEGER i): Returns the TYPE(string) value of lex member at index i
    - SUBROUTINE list%set(INTEGER i, TYPE(string) val): Assigns val to the index i of the lex member
  - Generic Procedures:
    - assignment(=): Assigns a type REAL(FJEMP) to all values in lex member
    - write: Uses write method on all elements of lex member

## FJEM Maths - WIP

#### New Features
- Constants - The following mathematical constants have been added:
  - pi_
  - e_
- Derived Types - The following derived types have been introduced:
  - "space": Dynamic length array of derived type "list"

##### Methods:
No new methods

##### Derived Types:
- space:
  - Members:
    - TYPE(list) obj
    - INTEGER order
  - Type-Bound Procedures:
    - space%add(INTEGER i, OPTIONAL TYPE(list) val(:)): Increases the order member by i and extends the obj member by i. Then if val is present, assigns val to the last i entries of the obj member
    - space%get(INTEGER i) Returns the TYPE(list) at index i of the obj member
