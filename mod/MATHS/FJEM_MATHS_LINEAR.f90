module FJEM_MATHS_LINEAR
  use FJEM_Base
  use FJEM_MATHS_TYPES
  implicit none

  CHARACTER(LEN=*), PARAMETER :: default_method = "GJ"

  interface
    module function gauss_jordan(t_matrix, s_vector) result(o_vector)
      TYPE(space) :: t_matrix
      TYPE(space) :: s_vector
      TYPE(space) :: o_vector
    end function gauss_jordan
  end interface

  contains
    function linear_solver(t_matrix, s_vector, method) result(o_vector)
      TYPE(space) :: t_matrix
      TYPE(space) :: s_vector
      CHARACTER(LEN=*), OPTIONAL :: method
      TYPE(space) :: o_vector
      CHARACTER(LEN=:), ALLOCATABLE :: selected_method

      if (present(method)) then
        selected_method = method
      else
        selected_method = default_method
      end if

      SELECT CASE(selected_method)
        CASE("GJ")
          o_vector = gauss_jordan(t_matrix, s_vector)
        CASE DEFAULT
          call ERROR("Unknown method in linear solver")
      END SELECT
    end function linear_solver
end module FJEM_MATHS_LINEAR
