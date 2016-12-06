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

!  WRITE(*, 200) SSN(1:3), SSN(4:5), SSN(6:9), Name, Street, County, VType, VMake, TopColor(4:25), BottomColor(4:25), Tag,&
!                      City, State(1:2), Zip(1:5), Zip(6:9)


!200 FORMAT(T5, A3, '-', A2, '-', A4, 2X, A20, 2X,  A30, 9X, A12, 2X   A15, 2X, A11, 2X, A22, 2X,  A22, 2X, A7&
!                      /T40,         A19, ', ', A2, 1X, A5, '-', A4 )


!WRITE(*, 300) SSN(1:3), SSN(4:5), SSN(6:9), Name, Street, ICtyCode, County, IVtCode, VType,&
!              TcCode, TopColor(1:3), TopColor(4:25), BcCode, BottomColor(1:3), BottomColor(4:25), Tag

!WRITE(*, 400) City, State(1:2), Zip(1:5), Zip(6:9), IVmCode

!First line of output
!300 FORMAT(A3, '-', A2, '-', A4, 2X, A20, 2X, A30, 3X, '[', I2.2, ']', A12, 2X,&
!          '[', I2.2, ']', A15, 2X, '[', I2.2, ']', 3A, 1X, A22, 2X, '[', I2.2, ']', 3A, 1X, A22, 2X, A7)

!Second line of output
!400 FORMAT(T14, A19, ", ", A2, A5, '-', A4, T95, '[', I2.2, ']', A11)


  WRITE(*, 10, advance="no") SSN(1:3), SSN(4:5), SSN(6:9)
10  FORMAT(A3, '-', A2, '-', A4, 1X)

  WRITE(*, 20, advance="no") Name
20  FORMAT(A20, 1X) !Spacing Good

  WRITE(*, 30, advance="no") Street
30  FORMAT(A30, 9X) !Spacing Good

  WRITE(*, 40, advance="no") ICtyCode, County
40  FORMAT('[', I2.2, ']', A12, 9X) !Spacing Good

  WRITE(*, 50, advance="no") IVtCode, VType
50  FORMAT('[', I2.2, ']', A15, 1X)

  WRITE(*, 60, advance="no") TcCode, TopColor(1:3), TopColor(4:25)
60 FORMAT('[', I2.2, ']', A3, 1X, A22, 1X)

  WRITE(*, 60, advance="no") BcCode, BottomColor(1:3), BottomColor(4:25)

  WRITE(*, "(A7)") Tag

  WRITE(*, 70, advance="no") City, IStCode, State(1:2), Zip(1:5), Zip(6:9)
70  FORMAT(T34, A19,", [", I2.2, ']' A2, 1X A5, '-', A4, 1X)

  WRITE(*, 80, advance="no") IStCode, State(3:22)
80  FORMAT('[', I2.2, ']', A20, 1X)

  WRITE(*, 90) IVmCode, VMake
90  FORMAT('[', I2.2, ']' A11)


END SUBROUTINE PRTRECORD
