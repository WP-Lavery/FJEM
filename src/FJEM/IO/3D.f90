MODULE FJEM_IO_3D
  USE FJEM_CORE
  IMPLICIT NONE
  PRIVATE
  PUBLIC wavefront

  TYPE :: wavefront
    contains
      PROCEDURE :: read => read_obj
  END TYPE

  INTERFACE
    MODULE SUBROUTINE read_obj(self, file_loc)
      CLASS(wavefront) :: self
      CHARACTER(LEN=*), INTENT(IN) :: file_loc
    END SUBROUTINE read_obj
  END INTERFACE
  
END MODULE FJEM_IO_3D
