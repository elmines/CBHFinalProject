cbhproj:	cbhproj.o dspmenu.o opt1.o opt2.o opt3.o opt4.o opt5.o opt6.o opt7.o opt2menu.o dspmenu2.o dspstate.o dspcounty.o dspmake.o dsptype.o dspcolor.o
	f95 cbhproj.o dspmenu.o opt1.o opt2.o opt3.o opt4.o opt5.o opt6.o opt7.o opt2menu.o dspmenu2.o dspstate.o dspcounty.o dspmake.o dsptype.o dspcolor.o -Wall -o cbhproj

opt1.o:		opt1.f95
	f95 opt1.f95 -Wall -c

opt2.o:		opt2.f95
	f95 opt2.f95 -Wall -c

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

opt2menu.o:	opt2menu.f95 
	f95 opt2menu.f95 -Wall -c

dspmenu2.o:	dspmenu2.f95
	f95 dspmenu2.f95 -Wall -c

dspstate.o:	dspstate.f95
	f95 dspstate.f95 -Wall -c

dspcounty.o:	dspcounty.f95
	f95 dspcounty.f95 -Wall -c

dspmake.o:	dspmake.f95
	f95 dspmake.f95 -Wall -c

dsptype.o:	dsptype.f95
	f95 dsptype.f95 -Wall -c

dspcolor.o:	dspcolor.f95
	f95 dspcolor.f95 -Wall -c

dspmenu.o:	dspmenu.f95
	f95 dspmenu.f95 -Wall -c

cbhproj.o:	cbhproj.f95
	f95 cbhproj.f95 -Wall -c

clear:
	rm -f *.out *.o
