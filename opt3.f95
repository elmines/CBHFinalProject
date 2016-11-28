SUBROUTINE OPT3

  IMPLICIT NONE

  INTERFACE
    RECURSIVE FUNCTION BINSEARCHREC (SSN, Low, High) RESULT (Record)
      CHARACTER :: Record*106 !Returns the record in the master.db file corresponding to SSN
      CHARACTER, INTENT(IN) :: SSN*9
      INTEGER, INTENT(IN) :: Low, High !Lower and upper bound record indices between which to search for SSN
    END FUNCTION BINSEARCHREC

    RECURSIVE FUNCTION BINSEARCHINDEX (SSN, Low, High) RESULT (Index)
      INTEGER :: Index !Returns the record number in the master.db file corresponding to SSN
      CHARACTER, INTENT(IN) :: SSN*9
      INTEGER, INTENT(IN) :: Low, High !Lower and upper bound record indices between which to search for SSN
    END FUNCTION BINSEARCHINDEX

  END INTERFACE


  CHARACTER :: ReadSSN*11, SSN*9
  CHARACTER :: Record*106
  INTEGER :: NumRecords

  INTEGER :: RecNumber


  OPEN(20, FILE = "master.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 106)

  DO 
    CALL SYSTEM("clear")
    WRITE (*, "(/T15, A//)") "* * * Police Information Record Lookup * * *"

    WRITE (*, "(T20, A)", advance = "no") "Enter a Social Security Number (with or without hyphens) or ""Q"" to exit: "
    READ(*, "(A11)") ReadSSN

    !Working exit statement
    IF (READSSN(1:1) == 'Q') EXIT

    IF (ReadSSN(4:4) == '-') THEN
      SSN = ReadSSN(1:3)//ReadSSN(5:6)//ReadSSN(8:11)
    ELSE
      SSN = ReadSSN(1:9)
    END IF


    READ(20, "(I4)", REC = 1) NumRecords
    Record = BINSEARCHREC(SSN, 2, NumRecords + 1)

    WRITE(*, "(/T20, A, A106)") "Record: ", Record

    !Code for debugging binsearchindex
    RecNumber = BINSEARCHINDEX(SSN, 2, NumRecords + 1)
    WRITE(*, "(T20, A, I4)") "DEBUG, Record Number: ", RecNumber

    WRITE(*, "(/T15, A)", advance="no") "Press Enter to continue . . ."
    READ *
  END DO

  CLOSE(20)

END SUBROUTINE OPT3
