SUBROUTINE OPT6
  USE POLICE
  IMPLICIT NONE

  INTERFACE
    INTEGER FUNCTION BSEARCH(SSN)
      CHARACTER, INTENT(IN) :: SSN*9
    END FUNCTION BSEARCH

    INTEGER FUNCTION CLEANSEARCH(SSN)
      CHARACTER, INTENT(IN) :: SSN*9
    END FUNCTION CLEANSEARCH
  END INTERFACE

  CHARACTER(*), PARAMETER :: Title = "* * * Police Information System Modify Record * * *"

  CHARACTER :: ReadSSN*11, SearchSSN*9, OldSSN*9, CurrentSSN*9, NewSSN*9, Opt*2
  CHARACTER :: ReadZip*10
  INTEGER :: NumRecords

  INTEGER :: RecNumber, TempRecNumber
  LOGICAL :: NewChanges = .FALSE., ChangesMade = .FALSE.    !Use to determine what message to display should the user opt to exit 

  OPEN(20, FILE = "master.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 106)

  DO
    CALL SYSTEM("clear")
    WRITE (*, "(/T15, A/)") Title

    WRITE(*, 100, advance = "no") "Enter a Social Security Number of Q to exit: "
100      FORMAT(/T20, A)
      READ(*, "(A11)") ReadSSN

    !User wants to quit?
    SELECT CASE(ReadSSN(1:1))
      CASE ('Q', 'q')
        EXIT
      CASE DEFAULT !Nothing for default case
    END SELECT


    IF (ReadSSN(4:4) == '-') THEN
      SearchSSN = ReadSSN(1:3)//ReadSSN(5:6)//ReadSSN(8:11)
    ELSE
      SearchSSN = ReadSSN(1:9)
    END IF

    OldSSN = SearchSSN
    CurrentSSN = SearchSSN !User to save an SSN before calling a bsearch
    NewSSN = SearchSSN !If the user never changes NewSSN, no sorting will be needed
    RecNumber = BSEARCH(SearchSSN)

    IF (RecNumber == -1) THEN

      IF (ReadSSN(4:4) == '-') THEN
        WRITE(*, "(/T20, A, A11, A)") "SSN ", ReadSSN, " not found."
      ELSE
        WRITE(*, 200) ReadSSN(1:3), ReadSSN(4:5), ReadSSN(6:9) 
200     FORMAT(/T20, "SSN ", A3, '-', A2, '-', A4, " not found.")
      END IF

      WRITE(*, "(/T20, A)", advance="no") "Press Enter to continue . . ."
       READ *
     CYCLE
    END IF


    DO
      CALL SYSTEM("clear")      
      WRITE (*, "(/T15, A/)") Title

      CALL DSPRECORD

      PRINT *
      CALL MODMENU

      WRITE (*, 100, advance = "no") "Enter the item # to update, W to write, or C to cancel: "
        READ(*, "(A2)") Opt

      SELECT CASE(Opt)

        CASE("1", "1.")
            WRITE(*, 100, advance = "no") "Enter a Social Security Number: "
              READ(*, "(A11)") ReadSSN
            IF (ReadSSN(4:4) == '-') THEN
              SearchSSN = ReadSSN(1:3)//ReadSSN(5:6)//ReadSSN(8:11)
            ELSE
              SearchSSN = ReadSSN(1:9)
            END IF

            TempRecNumber = CLEANSEARCH(SearchSSN)
            SSN = CurrentSSN !Prevents the SearchSSN from getting written to the module if it already exists in the master database
            IF (TempRecNumber /= -1 .AND. TempRecNumber /= RecNumber) THEN

              IF (ReadSSN(4:4) == '-') THEN
                  WRITE(*, "(/T20, A, A11, A)") "Error: SSN ", ReadSSN, " already exists."
              ELSE
                WRITE(*, 300) ReadSSN(1:3), ReadSSN(4:5), ReadSSN(6:9) 
300               FORMAT(/T20, "Error: SSN ", A3, '-', A2, '-', A4, " already exists.")
              END IF

              WRITE(*, 100, advance="no") "Press Enter to continue . . ."
                READ *
              CYCLE
            END IF
          CurrentSSN = SearchSSN
          NewSSN = SearchSSN !Use this to keep track of whether I need to call bubble later
          SSN = SearchSSN !Write the new SSN to the module
          ChangesMade = .TRUE.
          NewChanges = .TRUE.

        CASE("2", "2.")
          WRITE(*, 100, advance="no") "Enter last name, first name (Smith, Joe) of up to 20 characters: "
            READ(*, "(A20)") Name
          ChangesMade = .TRUE.
          NewChanges = .TRUE.

        CASE("3", "3.")
          WRITE(*, 100, advance="no") "Enter street address of up to 30 characters: "
            READ(*, "(A30)") Street
          ChangesMade = .TRUE.
          NewChanges = .TRUE.

        CASE("4", "4.")
          WRITE(*, 100, advance="no") "Enter a city of up to 19 characters: "
            READ(*, "(A19)") City
          ChangesMade = .TRUE.
          NewChanges = .TRUE.

        CASE ("5", "5.")
            WRITE(*, 100, advance="no") "Enter a 9-digit Zip code: "
              READ(*, "(A10)") ReadZip
              IF (ReadZip(6:6) == '-') THEN
                Zip = ReadZip(1:5)//ReadZip(7:10)
              ELSE
                Zip = ReadZip
              END IF
          ChangesMade = .TRUE.
          NewChanges = .TRUE.

        CASE("6", "6.")
          DO
            CALL SYSTEM("clear")
            CALL DSPSTATE
            WRITE(*, 100, advance="no") "Enter a state code (01-51): "
              READ(*, "(I2.2)") IStCode
            IF (1 <= IStCode .AND. IStCode <= 51) EXIT
            WRITE(*, 100, advance = "no") "Invalid state code. Press Enter to continue. . ."
            READ *
          END DO
          ChangesMade = .TRUE.
          NewChanges = .TRUE.

        CASE("7", "7.")
          DO
            CALL SYSTEM("clear")
            CALL DSPCOUNTY
            WRITE(*, 100, advance="no") "Enter a county code (00-67): "
              READ(*, "(I2.2)") ICtyCode
            IF (0 <= ICtyCode .AND. ICtyCode <= 67) EXIT
            WRITE(*, 100, advance = "no") "Invalid county code. Press Enter to continue. . ."
            READ *
          END DO
          ChangesMade = .TRUE.
          NewChanges = .TRUE.

        CASE("8", "8.")
          DO
            CALL SYSTEM("clear")
            CALL DSPVMAKE
            WRITE(*, 100, advance="no") "Enter a make code (01-51): "
              READ(*, "(I2.2)") IVmCode
            IF (1 <= IVmCode .AND. IVmCode <= 51) EXIT
            WRITE(*, 100, advance = "no") "Invalid make code. Press Enter to continue. . ."
            READ *
          END DO
          ChangesMade = .TRUE.
          NewChanges = .TRUE.

        CASE("9", "9.")
          DO
           CALL SYSTEM("clear")
           CALL DSPVTYPE
           WRITE(*, 100, advance="no") "Enter a type code (01-15): "
             READ(*, "(I2.2)") IVtCode
           IF (1 <= IVtCode .AND. IVtCode <= 15) EXIT
           WRITE(*, 100, advance = "no") "Invalid type code. Press Enter to continue. . ."
           READ *
         END DO
          ChangesMade = .TRUE.
          NewChanges = .TRUE.

        CASE("10")
          DO
            CALL SYSTEM("clear")
            CALL DSPCOLOR
            WRITE(*, 100, advance="no") "Enter a top color code (01-31): "
              READ(*, "(I2.2)") TcCode
            IF (1 <= TcCode .AND. TcCode <= 31) EXIT
            WRITE(*, 100, advance = "no") "Invalid color code. Press Enter to continue. . ."
            READ *
          END DO
          ChangesMade = .TRUE.
          NewChanges = .TRUE.

        CASE("11")
          DO
            CALL SYSTEM("clear")
            CALL DSPCOLOR
            WRITE(*, 100, advance="no") "Enter a bottom color code (01-31): "
              READ(*, "(I2.2)") BcCode
            IF (1 <= BcCode .AND. BcCode <= 31) EXIT
            WRITE(*, 100, advance = "no") "Invalid color code. Press Enter to continue. . ."
            READ *
          END DO
          ChangesMade = .TRUE.
          NewChanges = .TRUE.

        CASE("12")
          WRITE(*, 100, advance="no") "Enter a tag of up to 7 characteres: "
            READ(*, "(A7)") Tag
          ChangesMade = .TRUE.
          NewChanges = .TRUE.

        CASE("W", "w")
          IF (NewChanges) THEN
            WRITE(20, 400, Rec = RecNumber) SSN, Name, Street, City, Zip, IStCode, ICtyCode, IVtCode, TcCode, IVmCode,&
                                                 BcCode, Tag
400           FORMAT(A9, A20, A30, A19, A9, 6I2.2, A7)

            IF (SSN /= OldSSN) THEN
              CALL BUBBLE
              RecNumber = CLEANSEARCH(NewSSN) !Changes recnumber to correspond with the resorted data
              OldSSN = NewSSN !Prevents unnecessary calls to bubble in certain cases where the user change the SSN more than once
            END IF
            
            WRITE(*, 100) "Latest changes written."
            NewChanges = .FALSE.
          ELSE
            WRITE(*, 100) "No changes to be written."
          END IF
          WRITE(*, 100, advance = "no") "Press Enter to continue . . ."
          READ *,

   
        CASE("C", "c")

          IF (NewChanges) THEN
            WRITE(*, 100) "Latest changes discarded."
          ELSE IF (ChangesMade) THEN
            WRITE(*, 100) "No additional changes made."
          ELSE
            WRITE(*, 100) "No changes made."
          END IF

          WRITE(*, 100, advance = "no") "Press Enter to continue . . ."
          READ *
          EXIT !Exits mod submenu


        CASE DEFAULT
          WRITE(*, 100) "Invalid option selected."
          WRITE(*, 100, advance="no") "Press Enter to continue . . ."
          READ *


      END SELECT


    END DO


  END DO !End Option 6 Do loop



  CLOSE(20)
END SUBROUTINE OPT6
