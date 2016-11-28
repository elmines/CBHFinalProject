SUBROUTINE OPT4

  IMPLICIT NONE

  INTERFACE
    RECURSIVE FUNCTION BINSEARCHINDEX (SSN, Low, High) RESULT (Index)
      INTEGER :: Index !Returns the record number in the master.db file corresponding to SSN
      CHARACTER, INTENT(IN) :: SSN*9
      INTEGER, INTENT(IN) :: Low, High !Lower and upper bound record indices between which to search for SSN
    END FUNCTION BINSEARCHINDEX
  END INTERFACE

  CHARACTER :: ReadSSN*11, SSN*9
  CHARACTER :: NewRecord*106, SavedRecord*106
  INTEGER :: NumRecords

  INTEGER :: RecNumber

  OPEN(20, FILE = "master.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 106)
  READ(20, "(I4)", REC = 1) NumRecords

  DO 
    CALL SYSTEM("clear")
    WRITE (*, "(/T15, A//)") "* * * Police Information System Add Record * * *"

    WRITE (*, "(T20, A)", advance = "no") "Enter a Social Security Number (with or without hyphens) or ""Q"" to exit: "
    READ(*, "(A11)") ReadSSN

    !Working exit statement
    IF (READSSN(1:1) == 'Q') EXIT

    IF (ReadSSN(4:4) == '-') THEN
      SSN = ReadSSN(1:3)//ReadSSN(5:6)//ReadSSN(8:11)
    ELSE
      SSN = ReadSSN(1:9)
    END IF

    RecNumber = BINSEARCHINDEX(SSN, 2, NumRecords + 1)

    IF (RecNumber /= -1) THEN
      WRITE(*, "(A)") "Record already exists"
      WRITE(*, "(/T15, A)", advance = "no") "Press Enter to continue . . ."
      READ *
      CYCLE
    END IF

    
    





    WRITE(*, "(/T15, A)", advance="no") "Press Enter to continue . . ."
    READ *
  END DO

  CLOSE(20)



END SUBROUTINE OPT4
