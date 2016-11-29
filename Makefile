#
CC=f95
CFLAGS=
OBJ=cbhproj.o dspmenu.o \
opt1.o opt2.o dspmenu2.o opt3.o opt4.o opt5.o opt6.o opt7.o \
ldstate.o ldcounty.o ldvmake.o ldvtype.o ldcolor.o ldmaster.o \
bubble.o \
bsearch.o \
police.o \
dspstate.o dspcounty.o dspvmake.o dspvtype.o dspcolor.o \
dsprecord.o getstabbrev.o getst.o getcty.o getvtype.o \

cbhproj: $(OBJ)
	$(CC) -o cbhproj $(OBJ)

police.o police.mod: police.f95
	$(CC) -c police.f95


cbhproj.o: cbhproj.f95
	$(CC) -c cbhproj.f95

dspmenu.o: dspmenu.f95
	$(CC) -c dspmenu.f95

opt1.o: opt1.f95
	$(CC) -c opt1.f95
opt2.o: opt2.f95
	$(CC) -c opt2.f95

dspmenu2.o: dspmenu2.f95
	$(CC) -c dspmenu2.f95

opt3.o: opt3.f95
	$(CC) -c opt3.f95
opt4.o: opt4.f95
	$(CC) -c opt4.f95

opt5.o: opt5.f95
	$(CC) -c opt5.f95

opt6.o: opt6.f95
	$(CC) -c opt6.f95

opt7.o: opt7.f95
	$(CC) -c opt7.f95

ldstate.o: ldstate.f95
	$(CC) -c ldstate.f95

ldcounty.o: ldcounty.f95
	$(CC) -c ldcounty.f95

ldvmake.o: ldvmake.f95
	$(CC) -c ldvmake.f95

ldvtype.o: ldvtype.f95
	$(CC) -c ldvtype.f95

ldcolor.o: ldcolor.f95
	$(CC) -c ldcolor.f95

ldmaster.o: ldmaster.f95
	$(CC) -c ldmaster.f95

bubble.o: bubble.f95
	$(CC) -c bubble.f95

bsearch.o: bsearch.f95 police.o police.mod
	$(CC) -c bsearch.f95

dspstate.o: dspstate.f95
	$(CC) -c dspstate.f95

dspcounty.o: dspcounty.f95
	$(CC) -c dspcounty.f95

dspvmake.o: dspvmake.f95
	$(CC) -c dspvmake.f95

dspvtype.o: dspvtype.f95
	$(CC) -c dspvtype.f95

dspcolor.o: dspcolor.f95
	$(CC) -c dspcolor.f95

dsprecord.o: dsprecord.f95
	$(CC) -c dsprecord.f95

getstabbrev.o: getstabbrev.f95
	$(CC) -c getstabbrev.f95

getst.o: getst.f95
	$(CC) -c getst.f95

getcty.o: getcty.f95
	$(CC) -c getcty.f95

getvtype.o: getvtype.f95
	$(CC) -c getvtype.f95

clean:
	rm cbhproj *.o *.mod *.db core
