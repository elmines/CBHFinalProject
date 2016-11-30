SUBROUTINE GETST(State)
  USE POLICE
  IMPLICIT NONE

  !Interface variables
  CHARACTER, INTENT(OUT) :: State*22

  !Private variables
  INTEGER :: NumRecords


  OPEN(21, FILE = "state.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 22)
  READ(21, "(I2)", REC = 1) NumRecords

  IF (IStCode < 1 .OR. IStCode > NumRecords) THEN
    State = "**********************"
    CLOSE(21)
    RETURN
  END IF

  READ(21, "(A22)", REC = IStCode + 1) State

  CLOSE(21)
  RETURN
END SUBROUTINE GETST 
