!
!Writes the master.db database file from police1.data and police2.data
!
PROGRAM LDMASTER

  IMPLICIT NONE

  INTEGER :: Counter, rc
  CHARACTER :: Part1*3, Part2*2, Part3*78, Part4*23

  OPEN(7, FILE = "police1.data")
  OPEN(8, FILE = "police2.data")
  OPEN(9, FILE = "master.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 106)

  Counter = 0

  !Read from police1.data
  DO 
    READ(7, 100, IOSTAT = rc) Part1, Part2, Part3, Part4
100   FORMAT(A3, 1X, A2, 1X, A78, 1X, A23) !Use space format specifiers to skip over the hyphens in the data file

    IF (rc /= 0) EXIT

    Counter = Counter + 1
    WRITE(9, 200, REC = Counter + 1) Part1, Part2, Part3, Part4

    !PRINT *, "Counter = ", Counter
    !WRITE(*, 200) Part1, Part2, Part3, Part4
200   FORMAT(A3, A2, A78, A23)             !Write the data extracted from the data file to the database, but without hyphens
  END DO

PRINT *, "Records written after police1 loop: ", Counter

  !Repeat the process for police2.data
  DO 
    READ(8, 100, IOSTAT = rc) Part1, Part2, Part3, Part4

    IF (rc /= 0) EXIT

    Counter = Counter + 1
    WRITE(9, 200, REC = Counter + 1) Part1, Part2, Part3, Part4

    !PRINT *, "Counter = ", Counter
    !WRITE(*, 200) Part1, Part2, Part3, Part4

  END DO 


PRINT *, "Records written after police2 loop: ", Counter

  WRITE(9, "(I4.4)", REC = 1) Counter

  CLOSE(7)
  CLOSE(8)
  CLOSE(9)

END PROGRAM LDMASTER
