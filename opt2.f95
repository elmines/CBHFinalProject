SUBROUTINE OPT2
  CALL SYSTEM("clear")
  WRITE (*, "(/T15, A/)") "* * * Police Information System Option 2 * * *"
  WRITE (*, "(//T15, A//)") "User selected Option 2"
  WRITE(*, "(/T15, A)", advance="no") "Press Enter to continue . . ."
  READ *
END SUBROUTINE OPT2
