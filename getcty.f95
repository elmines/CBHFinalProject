FUNCTION GETCTY(Code)
  IMPLICIT NONE

  !Interface variables
  CHARACTER :: GETCTY*12
  INTEGER, INTENT(IN) :: Code

  !Private variables
  INTEGER, PARAMETER :: RecordLength = 12
  INTEGER :: NumRecords
  CHARACTER(RecordLength) :: Data


  OPEN(21, FILE = "county.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = RecordLength)
  READ(21, "(I2)", REC = 1) NumRecords

  IF (Code < 0 .OR. Code > NumRecords - 1) THEN
    GETCTY = "**"
    CLOSE(21)
    RETURN
  END IF

  READ(21, "(A22)", REC = Code + 2) Data
  GETCTY = Data

  CLOSE(21)
  RETURN
END FUNCTION GETCTY 
