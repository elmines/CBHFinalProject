#
CC=f95
CFLAGS=
OBJ=cbhproj.o dspmenu.o \
opt1.o opt2.o dspmenu2.o opt3.o opt4.o opt5.o opt6.o opt7.o \
ldstate.o \
dspstate.o dspcounty.o dspvmake.o dspvtype.o dspcolor.o \

cbhproj: $(OBJ)
	$(CC) -o cbhproj $(OBJ)

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