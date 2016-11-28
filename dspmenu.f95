SUBROUTINE DSPMENU
  CALL SYSTEM("clear")

  WRITE(*, "(/T15, A/)") "* * * Police Information System Main Menu * * *"

  WRITE(*, "(/T20, A)") "1 - Initial Data Load"
  WRITE(*, "(/T20, A)") "2 - Display Auxiliary Files" 
  WRITE(*, "(/T20, A)") "3 - Display a Record (by SSN)" 
  WRITE(*, "(/T20, A)") "4 - Add a Record"
  WRITE(*, "(/T20, A)") "5 - Delete a Record"
  WRITE(*, "(/T20, A)") "6 - Modify a Record"
  WRITE(*, "(/T20, A)") "7 - List Master File"
  WRITE(*, "(/T20, A)") "8 - Quit"

END SUBROUTINE DSPMENU




