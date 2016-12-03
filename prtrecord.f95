SUBROUTINE PRTRECORD
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

  WRITE(*, 200) SSN(1:3), SSN(4:5), SSN(6:9), Name, Street, County, VType, VMake, TopColor(4:25), BottomColor(4:25),&
                      City, State(1:2), Zip(1:5), Zip(6:9)


200 FORMAT(A3, '-', A2, '-', A4, 2X, A20, 2X,  A30, 9X, A12, 2X   A15, 2X, A11, 2X, A22, 2X,  A22,&
                      /T36,         A19, ', ', A2, 1X, A5, '-', A4 )

END SUBROUTINE PRTRECORD
