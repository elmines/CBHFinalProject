SUBROUTINE OPT2
  IMPLICIT NONE

  CHARACTER :: Option*1

  
  DO
    CALL DSPMENU2
    WRITE (*, "(///T20, A)", advance="no") "Select an option: "
    READ (*, "(A1)") Option

    SELECT CASE(Option)
      CASE ('1')
        CALL DSPSTATE
      CASE ('2')
        CALL DSPCOUNTY
      CASE ('3')
        CALL DSPVMAKE
      CASE ('4')
        CALL DSPVTYPE
      CASE ('5')
        CALL DSPCOLOR
      CASE ('6', 'Q', 'q', 'E', 'e')
        EXIT 
      CASE DEFAULT
        WRITE (*, "(/T18, A)") "Invalid option selected."
        WRITE (*, "(/T18, A)", advance="no") "Press Enter to continue . . ."
        READ *
    END SELECT
    CALL SYSTEM("clear")
  END DO
  CALL SYSTEM("clear")
END SUBROUTINE OPT2
