FUNCTION GETVTYPE(Code)
  IMPLICIT NONE

  !Interface variables
  CHARACTER :: GETVTYPE*15
  INTEGER, INTENT(IN) :: Code

  !Private variables
  INTEGER, PARAMETER :: RecordLength = 15
  INTEGER :: NumRecords
  CHARACTER(RecordLength) :: Data


  OPEN(21, FILE = "vtype.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = RecordLength)
  READ(21, "(I2)", REC = 1) NumRecords

  IF (Code < 1 .OR. Code > NumRecords) THEN
    GETVTYPE = "**"
    CLOSE(21)
    RETURN
  END IF

  READ(21, "(A15)", REC = Code + 1) Data
  GETVTYPE = Data

  CLOSE(21)
  RETURN
END FUNCTION GETVTYPE 
