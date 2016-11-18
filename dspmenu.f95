SUBROUTINE DSPMENU
  CALL SYSTEM("clear")

  WRITE(*, "(/T15, A/)") "* * * Police Information System Main Menu * * *"

  WRITE(*, "(/T20, A)") "1 - Initial Data Load"
  WRITE(*, "(/T20, A)") "2 - Display Record" 
  WRITE(*, "(/T20, A)") "3 - Option 3"
  WRITE(*, "(/T20, A)") "4 - Option 4"
  WRITE(*, "(/T20, A)") "5 - Option 5"
  WRITE(*, "(/T20, A)") "6 - Option 6"
  WRITE(*, "(/T20, A)") "7 - Option 7"
  WRITE(*, "(/T20, A)") "8 - Quit"

END SUBROUTINE DSPMENU




