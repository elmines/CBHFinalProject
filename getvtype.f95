SUBROUTINE GETVTYPE(Vtype)
  USE POLICE
  IMPLICIT NONE

  !Interface variables
  CHARACTER, INTENT(OUT) :: Vtype*15

  !Private variables
  INTEGER :: NumRecords


  OPEN(21, FILE = "vtype.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 15)
  READ(21, "(I2)", REC = 1) NumRecords

  IF (IVtCode < 1 .OR. IVtCode > NumRecords) THEN
    Vtype = "***************"
    CLOSE(21)
    RETURN
  END IF

  READ(21, "(A15)", REC = IVtCode + 1) Vtype

  CLOSE(21)
  RETURN
END SUBROUTINE GETVTYPE 
