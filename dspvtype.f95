SUBROUTINE DSPVTYPE

  IMPLICIT NONE

  INTEGER, PARAMETER :: RecordLength = 15, NumRows = 15, ColumnWidth = 20 

  CHARACTER(100) :: Line(NumRows) !Two-dimensional char array with NumRows rows and 100 columns
  CHARACTER(RecordLength) :: Data !RecordLength long character string
  INTEGER :: I, NumRecords, Row, Column, ColPos


  !Fill output array with spaces
  DO I = 1, NumRows
    Line = ' '
  END DO

  OPEN(7, FILE = "vtype.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = RecordLength)

  READ(7, "(I2.2)", REC = 1) NumRecords
  !PRINT *, "Debug, NumRecords = ", NumRecords

  Row = 1
  Column = 1

  DO I = 1, NumRecords
    ColPos = (Column - 1) * ColumnWidth

    READ(7, "(A15)", REC = I + 1) Data

    Line(Row)(ColPos + 4 : ColPos + 18) = Data !Write type name
    WRITE( Line(Row)(ColPos + 1 : ColPos + 2), "(I2.2)") I !Write identification code

    Row = Row + 1
    IF (Row > NumRows) THEN
       Row = 1
       Column = Column + 1 !Start reading to the next column
    END IF
  END DO

  WRITE(*, "(/T15, A/)") "* * * Police Information System Display Types * * *"

  DO I = 1, NumRows
    WRITE (*, "(T20, A100)") Line(I)
  END DO

  CLOSE(7)

END SUBROUTINE DSPVTYPE
