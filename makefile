cbhproj:	cbhproj.o dspmenu.o
	f95 cbhproj.o dspmenu.o -Wall -o cbhproj

opt1.o:		opt1.f95
	f95 opt1.f95 -Wall -c

opt2.o:		opt2.f95
	f95 opt1.f95 -Wall -c

opt3.o:		opt3.f95
	f95 opt3.f95 -Wall -c

opt4.o:		opt4.f95
	f95 opt4.f95 -Wall -c


opt5.o:		opt5.f95
	f95 opt5.f95 -Wall -c


opt6.o:		opt6.f95
	f95 opt6.f95 -Wall -c


opt7.o:		opt7.f95
	f95 opt7.f95 -Wall -c

dspmenu.o:	dspmenu.f95
	f95 dspmenu.f95 -Wall -c

cbhproj.o:	cbhproj.f95
	f95 cbhproj.f95 -Wall -c






clear:
	rm -f *.out *.o
