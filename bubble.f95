!Sorts the records in the master file by social security number
SUBROUTINE BUBBLE

  IMPLICIT NONE

  INTEGER, PARAMETER :: RecordLength = 106

  CHARACTER(RecordLength) :: Str1, Str2 !Both Str1 and Str2 are meant to temporarily store records read from the file
  INTEGER :: NumRecords, Pass, First
  LOGICAL :: Sorted

  !The routine does not call OPEN because it is assumed that master.db (20) is already open
  !OPEN(20, FILE = "master.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = RecordLength)

  Pass = 1
  READ(20, "(I4)", REC = 1) NumRecords
  Sorted = .FALSE.

  DO
    IF (Sorted) EXIT
    Sorted = .TRUE.

    DO First = 2, NumRecords - Pass + 1
      READ(20, "(A106)", Rec = First) Str1
      READ(20, "(A106)", Rec = First + 1) Str2

      !Sort only by the 9-digit social security number
      IF ( Str1(1:9) <= Str2(1:9) ) CYCLE

      !Swap the records
      WRITE(20, "(A106)", REC = First) Str2
      WRITE(20, "(A106)", Rec = First + 1) Str1
      Sorted = .FALSE.
    END DO
    Pass = Pass + 1
  END DO

  !CLOSE(20)

END SUBROUTINE BUBBLE 
