PROGRAM DEBUGGER

  IMPLICIT NONE

  INTEGER :: Number
  CHARACTER :: Data*110

  PRINT *, "Enter a record number: "
  READ *, Number

  OPEN(7, file = "master.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 106)

  READ(7, "(A106)",  REC = Number ) Data

  PRINT *, DATA

  CLOSE(7)

END PROGRAM DEBUGGER 
