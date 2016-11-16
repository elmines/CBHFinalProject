PROGRAM CBHPROJ
  IMPLICIT NONE

  CHARACTER :: Option*1

  
  DO
    CALL DSPMENU
    WRITE (*, "(///T20, A)", advance="no") "Select an option: "
    READ (*, "(A1)") Option

    SELECT CASE(Option)
      CASE ('1')
        CALL OPT1
      CASE ('2')
        CALL OPT2
      CASE ('3')
        CALL OPT3
      CASE ('4')
        CALL OPT4
      CASE ('5')
        CALL OPT5
      CASE ('6')
        CALL OPT6
      CASE ('7')
        CALL OPT7
      CASE ('8', 'Q', 'q', 'E', 'e')
        EXIT
      CASE DEFAULT
        WRITE (*, "(/T18, A)") "Invalid option selected."
        WRITE (*, "(/T18, A)", advance="no") "Press Enter to continue . . ."
        READ *
    END SELECT
    CALL SYSTEM("clear")
  END DO
  CALL SYSTEM("clear")
END PROGRAM CBHPROJ
