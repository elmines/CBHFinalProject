SUBROUTINE GETCTY(County)
  USE POLICE
  IMPLICIT NONE

  !Interface variables
  CHARACTER, INTENT(OUT) :: County*12

  !Private variables
  INTEGER :: NumRecords


  OPEN(21, FILE = "county.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 12)
  READ(21, "(I2)", REC = 1) NumRecords

  IF (ICtyCode < 0 .OR. ICtyCode > NumRecords - 1) THEN
    County = "************"
    CLOSE(21)
    RETURN
  END IF

  READ(21, "(A12)", REC = ICtyCode + 2) County

  CLOSE(21)
  RETURN
END SUBROUTINE GETCTY 
