SUBROUTINE LDCOLOR
  IMPLICIT NONE

  INTEGER :: Code, Records, BadRecords, rc
  CHARACTER :: Data*25

  OPEN(7, FILE = "color.data")
  OPEN(8, FILE = "color.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 25)

  Records = 0
  BadRecords = 0

  DO
    READ (7, 100, IOSTAT = rc) Code, Data
100   Format(I2, A25)
    
    IF (rc /= 0) EXIT

    IF (Code < 1 .OR. 31 < Code) THEN
      BadRecords = BadRecords + 1
      CYCLE
    END IF

    WRITE(8, 200, REC = code + 1) Data
200   Format(A25)
    
    Records = Records + 1
  END DO

  WRITE(8, 300, REC = 1) Records
300  Format(I2.2)

  WRITE(*, 400) Records, BadRecords
400 Format("Color Records Written: ", I2.2, T30, "Bad Records: ", I2.2)

  CLOSE(7)
  CLOSE(8)

END SUBROUTINE LDCOLOR
