SUBROUTINE OPT3

  IMPLICIT NONE

  INTERFACE
    INTEGER FUNCTION BSEARCH (SSN)
      CHARACTER, INTENT(IN) :: SSN*9
    END FUNCTION BSEARCH
  END INTERFACE


  CHARACTER :: ReadSSN*11, SSN*9
  CHARACTER :: Record*106
  INTEGER :: NumRecords

  INTEGER :: RecNumber


  OPEN(20, FILE = "master.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 106)

  DO 
    CALL SYSTEM("clear")
    WRITE (*, "(/T15, A//)") "* * * Police Information System [Display] * * *"

    WRITE (*, "(T20, A)", advance = "no") "Enter a Social Security Number (with or without hyphens) or ""Q"" to exit: "
    READ(*, "(A11)") ReadSSN

    !User wants to quit?
    SELECT CASE(ReadSSN(1:1))
      CASE ('Q', 'q', 'E', 'e')
        EXIT
      CASE DEFAULT !Nothing for default case
    END SELECT


    IF (ReadSSN(4:4) == '-') THEN
      SSN = ReadSSN(1:3)//ReadSSN(5:6)//ReadSSN(8:11)
    ELSE
      SSN = ReadSSN(1:9)
    END IF


    !Code for debugging binsearchindex
    RecNumber = BSEARCH(SSN)
    WRITE(*, "(T20, A, I4)") "DEBUG, Record Number: ", RecNumber
    IF (RecNumber /= -1) THEN
      READ(20, "(A106)", REC = RecNumber) Record
      WRITE(*, "(T20, A)") "Record: ", Record
    END IF

    WRITE(*, "(/T15, A)", advance="no") "Press Enter to continue . . ."
    READ *
  END DO

  CLOSE(20)

END SUBROUTINE OPT3
