SUBROUTINE MODMENU

  WRITE(*, 10) "1. SSN", "4. City", "7. County", "10. Top Color"
  WRITE(*, 20) "2. Name", "5. Zip", "8. Make", "11. Bottom Color"
  WRITE(*, 30) "3. Address", "6. State", "9. Type", "12. Tag"


10  FORMAT(T15, A6, T30, A7, T45, A9, T60, A13)
20  FORMAT(T15, A7, T30, A6, T45, A7, T60, A16)
30  FORMAT(T15, A10, T30, A8, T45, A7, T60, A7)

END SUBROUTINE MODMENU
