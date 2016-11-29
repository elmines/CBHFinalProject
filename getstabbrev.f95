FUNCTION GETSTABBREV(Code)
  IMPLICIT NONE

  !Interface variables
  CHARACTER :: GETSTABBREV*2
  INTEGER, INTENT(IN) :: Code

  !Private variables
  INTEGER, PARAMETER :: RecordLength = 22
  INTEGER :: NumRecords
  CHARACTER(RecordLength) :: Data


  OPEN(21, FILE = "state.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = RecordLength)
  READ(21, "(I2)", REC = 1) NumRecords

  IF (Code < 1 .OR. Code > NumRecords) THEN
    GETSTABBREV = "**"
    RETURN
  END IF

  READ(21, "(A22)", REC = Code + 1) Data
  GETSTABBREV = Data(1:2)

  RETURN
END FUNCTION GETSTABBREV 
