!Binary search fucntion
!Takes in a given SSN and returns the corresponding data record in master.db
!It is assumed that master.db is already open with a file handle of 20
RECURSIVE FUNCTION BINSEARCH (SSN, Low, High) RESULT (Record)
  CHARACTER :: Record*106
  CHARACTER, INTENT(IN) :: SSN*9
  INTEGER, INTENT(IN) :: Low, High !Lower and upper bound record indices between which to search for SSN


  INTEGER :: Mid                 !Index of the record about to be read in
  CHARACTER :: MiddleRecord*106  !Record read in

  IF (Low > High .OR. High < Low) THEN
    Record = "Not found"
    RETURN
  END IF

  Mid = (Low + High) / 2
  READ(20, "(A106)", REC = Mid) MiddleRecord

  IF (MiddleRecord(1:9) == SSN) THEN
    Record = MiddleRecord
  ELSE IF (MiddleRecord(1:9) < SSN) THEN
    Record = BINSEARCH(SSN, Mid + 1, High)!SSN has to be after MiddleRecord
  ELSE
    Record = BINSEARCH(SSN, Low, Mid - 1) !SSN has to be before MiddleRecord
  END IF

  RETURN

END FUNCTION BINSEARCH 
