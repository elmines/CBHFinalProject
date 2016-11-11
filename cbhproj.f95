PROGRAM CBHPROJ
  IMPLICIT NONE

  CHARACTER :: Option*1

  
  DO
    CALL DSPMENU
    WRITE (*, "(A)", advance="no") "Type an option and press Enter: "
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
      CASE ('Q', 'q', 'E', 'e')
        EXIT
      CASE DEFAULT
        WRITE (*, "(A)") "Invalid option selected."
        WRITE (*, "(A)", advance="no") "Press Enter to continue . . ."
        READ *
    END SELECT
    CALL SYSTEM("clear")
  END DO
  CALL SYSTEM("clear")
END PROGRAM CBHPROJ
