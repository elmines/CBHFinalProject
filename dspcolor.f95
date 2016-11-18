SUBROUTINE DSPCOLOR

  IMPLICIT NONE

  INTEGER, PARAMETER :: RecordLength = 25, NumRows = 16, ColumnWidth = 31

  CHARACTER(100) :: Line(NumRows) !Two-dimensional char array with NumRows rows and 100 columns
  CHARACTER(RecordLength) :: Data !RecordLength long character string
  INTEGER :: I, NumRecords, Row, Column, ColPos


  !Fill output array with spaces
  DO I = 1, NumRows
    Line = ' '
  END DO

  OPEN(7, FILE = "color.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = RecordLength)

  READ(7, "(I2.2)", REC = 1) NumRecords
  !PRINT *, "Debug, NumRecords = ", NumRecords

  Row = 1
  Column = 1

  DO I = 1, NumRecords
    ColPos = (Column - 1) * ColumnWidth

    READ(7, "(A25)", REC = I + 1) Data

    Line(Row)(ColPos + 4 : ColPos + 6) = Data(1:3) !Write color abbreviation
    Line(Row)(ColPos + 8 : ColPos + 29) = Data(4: ) !Write color name
    WRITE( Line(Row)(ColPos + 1 : ColPos + 2), "(I2.2)") I !Write identification code

    Row = Row + 1
    IF (Row > NumRows) THEN
       Row = 1
       Column = Column + 1 !Start reading to the next column
    END IF
  END DO

  WRITE(*, "(/T15, A/)") "* * * Police Information System Display Colors * * *"

  DO I = 1, NumRows
    WRITE (*, "(T15, A100)") Line(I)
  END DO

  CLOSE(7)

  WRITE (*, "(/T15, A)", advance="no") "Press Enter to continue . . ."
  READ *

END SUBROUTINE DSPCOLOR
