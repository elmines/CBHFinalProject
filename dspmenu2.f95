SUBROUTINE DSPMENU2
  CALL SYSTEM("clear")

  WRITE(*, "(/T15, A/)") "* * * Police Information System Option 2 Menu * * *"

  WRITE(*, "(/T20, A)") "1 - Display State Data"
  WRITE(*, "(/T20, A)") "2 - Display County Data"
  WRITE(*, "(/T20, A)") "3 - Display Vehicle Makes"
  WRITE(*, "(/T20, A)") "4 - Display Vehicle Types"
  WRITE(*, "(/T20, A)") "5 - Display Vehicle Colors"
  WRITE(*, "(/T20, A)") "6 - Quit"

END SUBROUTINE DSPMENU2




