FUNCTION GETCOLOR(Code)
  IMPLICIT NONE

  !Interface variables
  CHARACTER :: GETCOLOR*25
  INTEGER, INTENT(IN) :: Code

  !Private variables
  INTEGER, PARAMETER :: RecordLength = 25
  INTEGER :: NumRecords
  CHARACTER(RecordLength) :: Data


  OPEN(21, FILE = "color.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = RecordLength)
  READ(21, "(I2)", REC = 1) NumRecords

  IF (Code < 1 .OR. Code > NumRecords) THEN
    GETCOLOR = "**"
    RETURN
  END IF

  READ(21, "(A25)", REC = Code + 1) Data
  GETCOLOR = Data

  RETURN
END FUNCTION GETCOLOR 
