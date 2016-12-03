SUBROUTINE OPT5

  IMPLICIT NONE

  INTERFACE
    INTEGER FUNCTION BSEARCH (SSN)
      CHARACTER, INTENT(IN) :: SSN*9
    END FUNCTION BSEARCH
  END INTERFACE

  CHARACTER :: ReadSSN*11, SSN*9, Opt*1
  CHARACTER :: NextRecord*106
  INTEGER :: NumRecords

  INTEGER :: RecNumber, I


  OPEN(20, FILE = "master.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 106)

  DO 
    CALL SYSTEM("clear")
    WRITE (*, "(/T15, A/)") "* * * Police Information System Delete Record * * *"

    WRITE (*, 50, advance = "no") "Enter a Social Security Number or Q to quit: "
50    FORMAT(/T20, A)
    READ(*, "(A11)") ReadSSN

    !User wants to quit?
    SELECT CASE(ReadSSN(1:1))
      CASE ('Q', 'q')
        EXIT
      CASE DEFAULT !Nothing for default case
    END SELECT


    IF (ReadSSN(4:4) == '-') THEN
      SSN = ReadSSN(1:3)//ReadSSN(5:6)//ReadSSN(8:11)
    ELSE
      SSN = ReadSSN(1:9)
    END IF

    RecNumber = BSEARCH(SSN)

    IF (RecNumber == -1) THEN

      IF (ReadSSN(4:4) == '-') THEN
        WRITE(*, "(/T20, A, A11, A)") "SSN ", ReadSSN, " not found."
      ELSE
        WRITE(*, 100) ReadSSN(1:3), ReadSSN(4:5), ReadSSN(6:9) 
100     FORMAT(/T20, "SSN ", A3, '-', A2, '-', A4, " not found.")
      END IF

      WRITE(*, 50, advance="no") "Press Enter to continue . . ."
       READ *
     CYCLE
    END IF

    PRINT * !Extra line before displaying the record
    CALL DSPRECORD

    WRITE(*, 50, advance = "no") "Are you sure you want to delete this record (y/n)? "
      READ(*, "(A1)") Opt

    IF (Opt == 'y' .OR. Opt == 'Y') THEN

      READ(20, "(I4)", REC = 1) NumRecords

      DO I = RecNumber, NumRecords !Each iteration uses the record after record I, thus the limit is not NumRecords + 1
        READ(20, "(A106)", REC = I + 1) NextRecord
        WRITE(20, "(A106)", REC = I) NextRecord
      END DO

      !Reduce record count
      NumRecords = NumRecords - 1
      WRITE(20, "(I4.4)", REC = 1) NumRecords
      CALL BUBBLE

      WRITE(*, 50) "Record deleted."

    ELSE
      WRITE(*, 50) "Record not deleted."
    END IF

    WRITE(*, 50, advance="no") "Press Enter to continue . . ."
    READ *
  END DO

  CLOSE(20)

END SUBROUTINE OPT5
