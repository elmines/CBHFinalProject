!
!Writes the master.db database file from police1.data and police2.data
!
SUBROUTINE LDMASTER

  IMPLICIT NONE

  INTEGER :: Counter, rc
  CHARACTER :: Part1*3, Part2*2, Part3*78, Part4*23

  OPEN(7, FILE = "police1.data")
  OPEN(8, FILE = "police2.data")
  !20 is the global file handle for the master.db file
  OPEN(20, FILE = "master.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 106)

  Counter = 0

  !Read from police1.data
  DO 
    READ(7, 100, IOSTAT = rc) Part1, Part2, Part3, Part4
100   FORMAT(A3, 1X, A2, 1X, A78, 1X, A23) !Use space format specifiers to skip over the hyphens in the data file

    IF (rc /= 0) EXIT

    Counter = Counter + 1
    WRITE(20, 200, REC = Counter + 1) Part1, Part2, Part3, Part4

200   FORMAT(A3, A2, A78, A23)             !Write the data extracted from the data file to the database, but without hyphens
  END DO


  !Repeat the process for police2.data
  DO 
    READ(8, 100, IOSTAT = rc) Part1, Part2, Part3, Part4

    IF (rc /= 0) EXIT

    Counter = Counter + 1
    WRITE(20, 200, REC = Counter + 1) Part1, Part2, Part3, Part4

  END DO 

  WRITE(20, "(I4.4)", REC = 1) Counter

  !Sort the data
  CALL BUBBLE

  CLOSE(7)
  CLOSE(8)
  CLOSE(20)

!FIXME: Have the format code set to I4 rather than I4.4; need to check which is better.
  WRITE(*, "(A, I4.4)") "Master Records Written: ", Counter

END SUBROUTINE LDMASTER
