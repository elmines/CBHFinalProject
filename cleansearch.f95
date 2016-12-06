!Binary search fucntion
!Takes in a given SSN and returns the corresponding data record number in master.db
!It is assumed that master.db is already open with a file handle of 20
INTEGER FUNCTION CLEANSEARCH (SearchSSN) 
  USE POLICE
  IMPLICIT NONE

  CHARACTER, INTENT(IN) :: SearchSSN*9
  INTEGER :: Low, High, Mid, NumRecords !Lower and upper bound record indices between which to search for SearchSSN

  READ (20, "(I4)", REC = 1) NumRecords

  Low = 2
  High = NumRecords + 1
  CLEANSEARCH = -1

  DO
    IF (Low > High) RETURN

    Mid = (Low + High) / 2

    READ(20, "(A9)", Rec = Mid) SSN

    IF (SearchSSN < SSN) High = Mid - 1
    IF (SearchSSN > SSN) Low = Mid + 1
    
    IF (SearchSSN == SSN) THEN
      CLEANSEARCH = Mid
      RETURN
    END IF
  END DO
  
END FUNCTION CLEANSEARCH
