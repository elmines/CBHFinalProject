SUBROUTINE LDVMAKE
  IMPLICIT NONE

  INTEGER :: Code, Records, BadRecords, rc
  CHARACTER :: Data*11

  OPEN(7, FILE = "vmake.data")
  OPEN(8, FILE = "vmake.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 11)

  Records = 0
  BadRecords = 0

  DO
    READ (7, 100, IOSTAT = rc) Code, Data
100   Format(I2, A11)
    
    IF (rc /= 0) EXIT

    IF (Code < 1 .OR. 51 < Code) THEN
      BadRecords = BadRecords + 1
      CYCLE
    END IF

    WRITE(8, 200, REC = code + 1) Data
200   Format(A11)
    
    Records = Records + 1
  END DO

  WRITE(8, 300, REC = 1) Records
300  Format(I2.2)

  WRITE(*, 400) Records, BadRecords
400 Format(T17, "Make Records Written: ", I4.4, T50, "Bad Records: ", I2.2)

  CLOSE(7)
  CLOSE(8)

END SUBROUTINE LDVMAKE
