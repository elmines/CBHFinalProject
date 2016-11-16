SUBROUTINE OPT1
  CALL SYSTEM("clear")
  WRITE (*, "(/T15, A/)") "* * * Police Information System Option 1 * * *"

  CALL LDSTATE
  CALL LDCOUNTY
  CALL LDVMAKE

  WRITE(*, "(/T15, A)", advance="no") "Press Enter to continue . . ."
  READ *
END SUBROUTINE OPT1
