FUNCTION GETST(Code)
  IMPLICIT NONE

  !Interface variables
  CHARACTER :: GETST*20
  INTEGER, INTENT(IN) :: Code

  !Private variables
  INTEGER, PARAMETER :: RecordLength = 22
  INTEGER :: NumRecords
  CHARACTER(RecordLength) :: Data


  OPEN(21, FILE = "state.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = RecordLength)
  READ(21, "(I2)", REC = 1) NumRecords

  IF (Code < 1 .OR. Code > NumRecords) THEN
    GETST = "**"
    CLOSE(21)
    RETURN
  END IF

  READ(21, "(A22)", REC = Code + 1) Data
  GETST = Data(3:22)

  CLOSE(21)
  RETURN
END FUNCTION GETST 
