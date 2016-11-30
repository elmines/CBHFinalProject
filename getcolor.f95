SUBROUTINE GETCOLOR(TopColor, BottomColor)
  USE POLICE
  IMPLICIT NONE

  !Interface variables
  CHARACTER, INTENT(OUT) :: TopColor*25, BottomColor*25

  !Private variables
  INTEGER :: NumRecords


  OPEN(21, FILE = "color.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 25)
  READ(21, "(I2)", REC = 1) NumRecords

    TopColor = "*************************"
    BottomColor = "*************************"

  IF (1 <= TcCode .AND. TcCode <= NumRecords) READ(21, "(A25)", REC = TcCode + 1) TopColor


  IF (1 <= BcCode .AND. BcCode <= NumRecords) READ(21, "(A25)", REC = BcCode + 1) BottomColor

  CLOSE(21)
  RETURN
END SUBROUTINE GETCOLOR
