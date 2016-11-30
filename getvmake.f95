SUBROUTINE GETVMAKE(Vmake)
  USE POLICE
  IMPLICIT NONE

  !Interface variables
  CHARACTER, INTENT(OUT) :: Vmake*11

  !Private variables
  INTEGER :: NumRecords


  OPEN(21, FILE = "vmake.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 11)
  READ(21, "(I2)", REC = 1) NumRecords

  IF (IVmCode < 1 .OR. IVmCode > NumRecords) THEN
    Vmake = "***********" 
    CLOSE(21)
    RETURN
  END IF

  READ(21, "(A11)", REC = IVmCode + 1) Vmake

  CLOSE(21)
  RETURN
END SUBROUTINE GETVMAKE 
