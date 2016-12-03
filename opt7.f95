SUBROUTINE OPT7
  USE POLICE
  IMPLICIT NONE

  CHARACTER(*), PARAMETER :: Title = "* * * Police Information Display Records * * *"

  INTEGER :: NumRecords, I, Counter
  CHARACTER :: Opt*1


  CALL SYSTEM("clear")
  WRITE (*, "(/T15, A/)") Title
  WRITE(*, 100)
100  FORMAT(T5, "SSN", 10X, "Name", 18X, "Address", 32X, "County", 8X, "Type", 13X, "Make", 9X, "Top Color", 15X, "Bottom Color",&
       12X, "Tag")
  WRITE(*, 300)
300   FORMAT(T5, 173('=') )

  OPEN(20, FILE = "master.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 106)
  READ(20, "(I4)", REC = 1) NumRecords

  Counter = 0
  DO I = 2, NumRecords + 1

    !Read Record
    READ(20, 200, Rec = I) SSN, Name, Street, City, Zip, IStCode, ICtyCode, IVtCode, TcCode, IVmCode, BcCode, Tag
200   FORMAT(                A9 , A20 , A30   , A19 , A9 , 6I2,                                                  A7)


    CALL PRTRECORD
    WRITE(*, 300)

    !PRINT * !Add a break between records
    Counter = Counter + 1

    IF (Counter == 5) THEN

      IF (I < NumRecords + 1) THEN

        WRITE(*, "(/T5, A)", advance = "no") "Press Enter to continue or Q to quit: "
          READ(*, "(A1)") Opt
  
        IF (Opt == 'Q' .OR. Opt == 'q') THEN
           CLOSE(20)
           RETURN
        END IF

        Counter = 0
        CALL SYSTEM("clear")
        WRITE(*, "(/T15, A/)") Title
        WRITE(*, 100)
        WRITE(*, 300)
      END IF

    END IF
  END DO


  IF (Counter /= 0) THEN
    WRITE(*, "(/T5, A)", advance = "no") "Press Enter to continue . . ."
    READ *
  END IF
       
  CLOSE(20)

END SUBROUTINE OPT7
