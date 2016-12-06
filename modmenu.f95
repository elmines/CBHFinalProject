SUBROUTINE MODMENU

  WRITE(*, 10) "1. SSN", "4. City", "7. County", "10. Top Color"
  WRITE(*, 20) "2. Name", "5. Zip", "8. Make", "11. Bottom Color"
  WRITE(*, 30) "3. Address", "6. State", "9. Type", "12. Tag"


10  FORMAT(T20, A6, T35, A7, T50, A9, T65, A13)
20  FORMAT(T20, A7, T35, A6, T50, A7, T65, A16)
30  FORMAT(T20, A10, T35, A8, T50, A7, T65, A7)

END SUBROUTINE MODMENU
