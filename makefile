cbhproj:	cbhproj.o dspmenu.o opt1.o opt2.o opt3.o opt4.o opt5.o opt6.o opt7.o
	f95 cbhproj.o dspmenu.o opt*.o -Wall -o cbhproj

cbhproj.o:	cbhproj.f95
	f95 cbhproj.f95 -Wall

opt1.o:		opt1.f95
	f95 opt1.f95 -Wall

opt2.o:		opt3.f95
	f95 opt1.f95 -Wall

opt3.o:		opt4.f95
	f95 opt1.f95 -Wall


opt4.o:		opt5.f95
	f95 opt1.f95 -Wall


opt5.o:		opt6.f95
	f95 opt1.f95 -Wall


opt6.o:		opt6.f95
	f95 opt1.f95 -Wall

opt7.o:		opt7.f95
	f95 opt1.f95 -Wall

clear:
	rm -f *.out *.o
