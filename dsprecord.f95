SUBROUTINE DSPRECORD
  USE POLICE
  IMPLICIT NONE

  !Initial Debugging print statements
  !PRINT *, SSN
  WRITE(*, "(T20, A3, A1, A2, A1, A4)") SSN(1:3), '-', SSN(4:5), '-', SSN(6:9)

  !PRINT *, Name
  WRITE(*, "(T20, A20)")                Name


  !PRINT *, Street
  WRITE(*, "(/T20, A30)") Street

  !PRINT *, City
  WRITE(*, "(T20, A19, A1, 1X, A2, 1X, A5, A1, A4)") City, ",", "XX", Zip(1:5), '-', Zip(6:9)
  !PRINT *, Zip

  PRINT *, IStCode
  PRINT *, ICtyCode
  PRINT *, IVtCode
  PRINT *, IVmCode
  PRINT *, TcCode
  PRINT *, BcCode
  PRINT *, Tag
END SUBROUTINE DSPRECORD
