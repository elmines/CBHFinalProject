SUBROUTINE OPT7
  USE POLICE
  IMPLICIT NONE

  CHARACTER(*), PARAMETER :: Title = "* * * Police Information Display Master Record * * *"

  INTEGER :: NumRecords, I, Counter
  CHARACTER :: Opt*1


  CALL SYSTEM("clear")
  WRITE (*, "(/T15, A/)") Title

  OPEN(20, FILE = "master.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 106)
  READ(20, "(I4)", REC = 1) NumRecords

  Counter = 0
  DO I = 2, NumRecords + 1
    !CALL SYSTEM("clear")

    READ(20, 100, Rec = I) SSN, Name, Street, City, Zip, IStCode, ICtyCode, IVtCode, TcCode, IVmCode, BcCode, Tag
100   FORMAT(                A9 , A20 , A30   , A19 , A9 , 6I2,                                                  A7)


    !CALL DSPRECORD
    CALL PRTRECORD
    PRINT * !Add a break between records
    Counter = Counter + 1

    IF (Counter == 5) THEN
      WRITE(*, "(A)", advance = "no") "Press Enter to continue or Q to quit: "
        READ(*, "(A1)") Opt

      IF (Opt == 'Q' .OR. Opt == 'q') EXIT

      Counter = 0
      CALL SYSTEM("clear")
      WRITE(*, "(/T15, A/)") Title

    END IF

  END DO
       



  WRITE(*, "(/T15, A)", advance="no") "Press Enter to continue . . ."
  READ *
END SUBROUTINE OPT7
