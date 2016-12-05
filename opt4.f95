SUBROUTINE OPT4
  USE POLICE
  IMPLICIT NONE

  INTERFACE
    INTEGER FUNCTION BSEARCH (SSN)
      CHARACTER, INTENT(IN) :: SSN*9
    END FUNCTION BSEARCH
  END INTERFACE


  CHARACTER(*), PARAMETER :: Title = "* * * Police Information System Add Record * * *"
  CHARACTER :: ReadSSN*11, NewSSN*9, Opt*1
  INTEGER :: NumRecords

  INTEGER :: RecNumber


  OPEN(20, FILE = "master.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 106)
  READ(20, "(I4)", REC = 1) NumRecords

  DO 
    CALL SYSTEM("clear")
    WRITE (*, "(/T15, A/)") Title

    WRITE (*, 50, advance = "no") "Enter a Social Security Number or Q to exit: "
50    FORMAT(/T20, A)
    READ(*, "(A11)") ReadSSN

    !User wants to quit?
    SELECT CASE(ReadSSN(1:1))
      CASE ('Q', 'q')
        EXIT
      CASE DEFAULT !Nothing for default case
    END SELECT


    IF (ReadSSN(4:4) == '-') THEN
      NewSSN = ReadSSN(1:3)//ReadSSN(5:6)//ReadSSN(8:11)
    ELSE
      NewSSN = ReadSSN(1:9)
    END IF

    RecNumber = BSEARCH(NewSSN)

    IF (RecNumber /= -1) THEN

      IF (ReadSSN(4:4) == '-') THEN
        WRITE(*, "(/T20, A, A11, A)") "Error: SSN ", ReadSSN, " already exists."
      ELSE
        WRITE(*, 100) ReadSSN(1:3), ReadSSN(4:5), ReadSSN(6:9) 
100     FORMAT(/T20, "Error: SSN ", A3, '-', A2, '-', A4, " already exists.")
      END IF

      WRITE(*, 50, advance="no") "Press Enter to continue . . ."
       READ *
     CYCLE
    END IF

    SSN = NewSSN

    WRITE(*, 50, advance="no") "Enter last name, first name (Smith, Joe) of up to 20 characters: "
      READ(*, "(A20)") Name

    WRITE(*, 50, advance="no") "Enter street address of up to 30 characters: "
      READ(*, "(A30)") Street

    WRITE(*, 50, advance="no") "Enter a city of up to 19 characters: "
      READ(*, "(A19)") City

    !What format did Darren want the ZIP Code read in as?
    WRITE(*, 50, advance="no") "Enter a ZIP Code (XXXXX-XXXX): "
      READ(*, "(A5, 1X, A4)") Zip(1:5), Zip(6:9)

    DO
      CALL SYSTEM("clear")
      CALL DSPSTATE
      WRITE(*, 50, advance="no") "Enter a state code (01-51): "
        READ(*, "(I2.2)") IStCode
      IF (1 <= IStCode .AND. IStCode <= 51) EXIT
      WRITE(*, 50, advance = "no") "Invalid state code. Press Enter to continue. . ."
      READ *
    END DO

    DO
      CALL SYSTEM("clear")
      CALL DSPCOUNTY
      WRITE(*, 50, advance="no") "Enter a county code (00-67): "
        READ(*, "(I2.2)") ICtyCode
      IF (0 <= ICtyCode .AND. ICtyCode <= 67) EXIT
      WRITE(*, 50, advance = "no") "Invalid county code. Press Enter to continue. . ."
      READ *
    END DO

    DO
      CALL SYSTEM("clear")
      CALL DSPVTYPE
      WRITE(*, 50, advance="no") "Enter a type code (01-15): "
        READ(*, "(I2.2)") IVtCode
      IF (1 <= IVtCode .AND. IVtCode <= 15) EXIT
      WRITE(*, 50, advance = "no") "Invalid type code. Press Enter to continue. . ."
      READ *
    END DO

    DO
      CALL SYSTEM("clear")
      CALL DSPVMAKE
      WRITE(*, 50, advance="no") "Enter a make code (01-51): "
        READ(*, "(I2.2)") IVmCode
      IF (1 <= IVmCode .AND. IVmCode <= 51) EXIT
      WRITE(*, 50, advance = "no") "Invalid make code. Press Enter to continue. . ."
      READ *
    END DO

    DO
      CALL SYSTEM("clear")
      CALL DSPCOLOR
      WRITE(*, 50, advance="no") "Enter a top color code (01-31): "
        READ(*, "(I2.2)") TcCode
      IF (1 <= TcCode .AND. TcCode <= 31) EXIT
      WRITE(*, 50, advance = "no") "Invalid color code. Press Enter to continue. . ."
      READ *
    END DO

    DO
      CALL SYSTEM("clear")
      CALL DSPCOLOR
      WRITE(*, 50, advance="no") "Enter a bottom color code (01-31): "
        READ(*, "(I2.2)") BcCode
      IF (1 <= BcCode .AND. BcCode <= 31) EXIT
      WRITE(*, 50, advance = "no") "Invalid color code. Press Enter to continue. . ."
      READ *
    END DO

    CALL SYSTEM("clear")
    WRITE (*, "(/T15, A/)") Title
    WRITE(*, 50, advance="no") "Enter a tag of up to 7 characteres: "
      READ(*, "(A7)") Tag

    CALL SYSTEM("clear")
    WRITE (*, "(/T15, A/)") Title
    CALL DSPRECORD
    WRITE(*, 50, advance ="no") "Are you sure you want to add this record (y/n)? "
      READ(*, "(A1)") Opt

    IF (Opt == 'y' .OR. Opt == 'Y') THEN
                         !Write after the other records
      WRITE(20, 200, Rec = NumRecords + 2) NewSSN, Name, Street, City, Zip, IStCode, ICtyCode, IVtCode, TcCode, IVmCode, BcCode, Tag
200    FORMAT(                            A9 ,    A20 , A30   , A19 , A9 , 6I2.2,                                                A7)

      NumRecords = NumRecords + 1
      WRITE(20, "(I4.4)", REC = 1) NumRecords
      CALL BUBBLE

      WRITE(*, 50) "Record added."
    ELSE
      WRITE(*, 50) "Record not added."
    END IF

    WRITE(*, 50, advance="no") "Press Enter to continue . . ."
    READ *
  END DO

  CLOSE(20)

END SUBROUTINE OPT4
