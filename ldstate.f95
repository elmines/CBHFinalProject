SUBROUTINE LDSTATE
  IMPLICIT NONE

  INTEGER :: Code, Records, BadRecords, rc
  CHARACTER :: Data*22

  PRINT *, "User called LDSTATE"

  OPEN(7, FILE = "state.data")
  OPEN(8, FILE = "state.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 22)

  Records = 0
  BadRecords = 0

  DO
    READ (7, 100, IOSTAT = rc) Code, Data
100   Format(I2, A22)
    
    IF (rc /= 0) EXIT

    IF (Code < 1 .OR. 51 < Code) THEN
      BadRecords = BadRecords + 1
      CYCLE
    END IF

    WRITE(8, 200, REC = code + 1) Data
200   Format(A22)
    
    Records = Records + 1
  END DO

  WRITE(8, 300, REC = 1) Records
300  Format(I2.2)

  WRITE(*, 400) Records, BadRecords
400 Format("State Records Written: ", I2.2, T30, "Bad Records: ", I2.2)

  CLOSE(7)
  CLOSE(8)

END SUBROUTINE LDSTATE
