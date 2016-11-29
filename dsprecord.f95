SUBROUTINE DSPRECORD
  USE POLICE
  IMPLICIT NONE

  INTERFACE
    FUNCTION GETSTABBREV(Code)
      CHARACTER :: GETSTABBREV*2
      INTEGER, INTENT(IN) :: Code
    END FUNCTION GETSTABBREV

    FUNCTION GETST(Code)
      CHARACTER :: GETST*20
      INTEGER, INTENT(IN) :: Code
    END FUNCTION GETST

    FUNCTION GETCTY(Code)
      CHARACTER :: GETCTY*12
      INTEGER, INTENT(IN) :: Code
    END FUNCTION GETCTY

    FUNCTION GETVTYPE(Code)
      CHARACTER :: GETVTYPE*15
      INTEGER, INTENT(IN) :: Code
    END FUNCTION GETVTYPE

    FUNCTION GETVMAKE(Code)
      CHARACTER :: GETVMAKE*11
      INTEGER, INTENT(IN) :: Code
    END FUNCTION

    FUNCTION GETCOLOR(Code)
      CHARACTER :: GETCOLOR*25
      INTEGER, INTENT(IN) :: Code
    END FUNCTION GETCOLOR
  END INTERFACE

  CHARACTER :: StateAbbrev*2, State*20, County*12, VType*15, VMake*11, TColor*25, BColor*25

  StateAbbrev = GETSTABBREV(IStCode)
  State = GETST(IStCode)
  County = GETCTY(ICtyCode)
  VType = GETVTYPE(IVtCode)
  VMake = GETVMAKE(IVmCode)
  TColor = GETCOLOR(TcCode)
  BColor = GETCOLOR(BcCode)

  WRITE(*, "(T20, A3, A1, A2, A1, A4)") SSN(1:3), '-', SSN(4:5), '-', SSN(6:9)
  WRITE(*, "(T20, A20)")                Name

  WRITE(*, "(/T20, A30)") Street
  WRITE(*, "(T20, A19, A1, 1X, A2, 1X, A5, A1, A4)") City, ",", StateAbbrev, Zip(1:5), '-', Zip(6:9)

  WRITE(*, "(/T20,A)") "Vehicle Information"
    WRITE(*, "(T25, A, I2.2, A, A20)") "State: (", IStCode, ")", State
    WRITE(*, "(T25, A, I2.2, A, A12)") "County: (", ICtyCode, ")", County
    WRITE(*, "(T25, A, I2.2, A, A15)") "Type: (", IVtCode, ")", VType 
    WRITE(*, "(T25, A, I2.2, A, A11)") "Make: (", IVmCode, ")", VMake

    WRITE(*, "(/T25, A)") "Color"
      WRITE(*, "(T30, A, I2.2, A, A25)") "Top: (", TcCode, ")", TColor
      WRITE(*, "(T30, A, I2.2, A, A25)") "Bottom: (", BcCode, ")", BColor

    WRITE(*, "(/T25, A, A7)") "License Plate: ", Tag

END SUBROUTINE DSPRECORD
