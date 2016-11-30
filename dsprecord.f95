SUBROUTINE DSPRECORD
  USE POLICE
  IMPLICIT NONE

  INTERFACE

    SUBROUTINE GETST(State)
      CHARACTER, INTENT(OUT) :: State*22
    END SUBROUTINE GETST

    SUBROUTINE GETCTY(County)
      CHARACTER, INTENT(OUT) :: County*12
    END SUBROUTINE GETCTY

    SUBROUTINE GETVTYPE(Vtype)
      CHARACTER, INTENT(OUT) :: Vtype*15
    END SUBROUTINE GETVTYPE

    SUBROUTINE GETVMAKE(Vmake)
      CHARACTER, INTENT(OUT) :: Vmake*11
    END SUBROUTINE GETVMAKE

    SUBROUTINE GETCOLOR(TopColor, BottomColor)
      CHARACTER, INTENT(OUT) :: TopColor*25, BottomColor*25
    END SUBROUTINE GETCOLOR

  END INTERFACE

  CHARACTER :: State*22, County*12, VType*15, VMake*11, TopColor*25, BottomColor*25

  CALL GETST(State)
  CALL GETCTY(County)
  CALL GETVTYPE(VType)
  CALL GETVMAKE(VMake)
  CALL GETCOLOR(TopColor, BottomColor)

  WRITE(*, 100) SSN(1:3),SSN(4:5), SSN(6:9)
100 FORMAT(T21, "SSN: ", A3, '-', A2, '-', A4)

  WRITE(*, 200 ) Name
200 FORMAT(T20, "Name: ", A20)

  WRITE(*, 300) Street, City, State(1:2), Zip(1:5), Zip(6:9)
300 FORMAT(/T20, A30, /T20 A19, ", ", A2, 1X, A5, '-', A4/) 

    WRITE(*, 400) IStCode, State(3:22)
400   FORMAT(T27, "State: [", I2.2, ']', 1X,A20)

    WRITE(*, 500) ICtyCode, County
500   FORMAT(T26, "County: [", I2.2, ']', 1X,A12)

    WRITE(*, 600) IVtCode, VType
600   FORMAT(T28, "Type: [", I2.2, ']', 1X,A15)

    WRITE(*, 700) IVmCode, VMake
700   FORMAT(T28, "Make: [", I2.2, ']', 1X, A11)

    WRITE(*, 800) TcCode, TopColor(1:3), TopColor(4:25), BcCode, BottomColor(1:3), BottomColor(4:25)
800   FORMAT(T23, "Top Color: [", I2.2, "]",  1X, A3, 1X, A22/, &
             T20, "Bottom Color: [", I2.2, "]", 1X, A3, 1X, A22)

    WRITE(*, 900) Tag
900   FORMAT(T29, "Tag:", 6X, A7)

END SUBROUTINE DSPRECORD
