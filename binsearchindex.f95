!Binary search fucntion
!Takes in a given SSN and returns the corresponding data record number in master.db
!It is assumed that master.db is already open with a file handle of 20
RECURSIVE FUNCTION BINSEARCHINDEX (SSN, Low, High) RESULT (Index)
  INTEGER :: Index
  CHARACTER, INTENT(IN) :: SSN*9
  INTEGER, INTENT(IN) :: Low, High !Lower and upper bound record indices between which to search for SSN

  INTEGER :: Mid                 !Index of the record about to be read in
  CHARACTER :: MiddleRecord*106  !Record read in

  IF (Low > High .OR. High < Low) THEN
    Index = -1
    RETURN
  END IF

  Mid = (Low + High) / 2
  READ(20, "(A106)", REC = Mid) MiddleRecord

  IF (MiddleRecord(1:9) == SSN) THEN
    Index = Mid
  ELSE IF (MiddleRecord(1:9) < SSN) THEN
    Index = BINSEARCHINDEX(SSN, Mid + 1, High)!SSN has to be after MiddleRecord
  ELSE
    Index = BINSEARCHINDEX(SSN, Low, Mid - 1) !SSN has to be before MiddleRecord
  END IF

  RETURN

END FUNCTION BINSEARCHINDEX
