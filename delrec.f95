
SUBROUTINE DELREC (SSN)

  INTERFACE
    RECURSIVE FUNCTION BINSEARCHINDEX (SSN, Low, High) RESULT (Index)
      INTEGER :: Index 
      CHARACTER, INTENT(IN) :: SSN*9
      INTEGER, INTENT(IN) :: Low, High
    END FUNCTION BINSEARCHINDEX
  END INTERFACE

  IMPLICIT NONE
  CHARACTER, INTENT(IN) :: SSN*9, NextRecord*106

  INTEGER :: NumRecords, Index, Rec

  READ(20, "(I4)", REC = 1) NumRecords

  Index = BINSEARCHINDEX(SSN, 2, NumRecords + 1)

  IF (Index == -1) RETURN

  IF (Index == NumRecords + 1) THEN
    !Do something to eliminate the text from that row
    RETURN
  END IF

  !Limit isn't NumRecords + 1; each iteration depends on the next record
  DO Rec = Index, NumRecords
    READ (20, "(A106)", REC = Index + 1) NextRecord
    WRITE (20, "(A106)", REC = Index) NextRecord
  END DO

  !Do something to eliminate the text from the last row

  !Decrement the record count
  WRITE(20, "(I4.4)", Rec = 1) NumRecords - 1

END SUBROUTINE DELREC
