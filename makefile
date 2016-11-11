cbhproj:	cbhproj.o dspmenu.o opt1.o opt2.o opt3.o opt4.o opt5.o opt6.o opt7.o
	f95 cbhproj.o dspmenu.o opt*.o -Wall -o cbhproj

cbhproj.o:	cbhproj.c
	f95 cbhproj.c -Wall

opt1.o:		opt1.c
	f95 opt1.c -Wall

opt2.o:		opt3.c
	f95 opt1.c -Wall

opt3.o:		opt4.c
	f95 opt1.c -Wall


opt4.o:		opt5.c
	f95 opt1.c -Wall


opt5.o:		opt6.c
	f95 opt1.c -Wall


opt6.o:		opt6.c
	f95 opt1.c -Wall

opt7.o:		opt7.c
	f95 opt1.c -Wall

clear:
	rm -f *.out *.o
