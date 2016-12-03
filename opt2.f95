SUBROUTINE OPT2
  IMPLICIT NONE

  CHARACTER :: Option*1

  
  DO
    CALL DSPMENU2
    WRITE (*, "(///T20, A)", advance="no") "Select an option: "
    READ (*, "(A1)") Option

    SELECT CASE(Option)
      CASE ('1')
        CALL SYSTEM("clear")
        CALL DSPSTATE
      CASE ('2')
        CALL SYSTEM("clear")
        CALL DSPCOUNTY
      CASE ('3')
        CALL SYSTEM("clear")
        CALL DSPVMAKE
      CASE ('4')
        CALL SYSTEM("clear")
        CALL DSPVTYPE
      CASE ('5')
        CALL SYSTEM("clear")
        CALL DSPCOLOR
      CASE ('6', 'Q', 'q')
        EXIT 
      CASE DEFAULT
        WRITE (*, "(/T20, A)") "Invalid option selected."
    END SELECT
        WRITE (*, "(/T20, A)", advance="no") "Press Enter to continue . . ."
        READ *
    CALL SYSTEM("clear")
  END DO
END SUBROUTINE OPT2
