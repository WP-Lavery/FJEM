PROGRAM error_probe
  USE FJEM_CORE_ERROR
  IMPLICIT NONE

  call throw_warning("Error_probe warning test executed successfully!")
  call throw_error("Error_probe error test executed successfully!", 42)
END PROGRAM error_probe
