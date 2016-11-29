FUNCTION GETVMAKE(Code)
  IMPLICIT NONE

  !Interface variables
  CHARACTER :: GETVMAKE*11
  INTEGER, INTENT(IN) :: Code

  !Private variables
  INTEGER, PARAMETER :: RecordLength = 11 
  INTEGER :: NumRecords
  CHARACTER(RecordLength) :: Data


  OPEN(21, FILE = "vmake.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = RecordLength)
  READ(21, "(I2)", REC = 1) NumRecords

  IF (Code < 1 .OR. Code > NumRecords) THEN
    GETVMAKE = "**"
    CLOSE(21)
    RETURN
  END IF

  READ(21, "(A11)", REC = Code + 1) Data
  GETVMAKE = Data

  CLOSE(21)
  RETURN
END FUNCTION GETVMAKE 
