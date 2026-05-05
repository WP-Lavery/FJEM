MODULE FJEM_MATHS_CONSTANTS
  use FJEM_Base
  implicit none
  private
  public pi_, e_

  REAL(KIND=dp), PARAMETER :: pi_ = 4.0_dp * ATAN(1.0_dp)
  REAL(KIND=dp), PARAMETER :: e_ = EXP(1.0_dp)

END MODULE FJEM_MATHS_CONSTANTS
