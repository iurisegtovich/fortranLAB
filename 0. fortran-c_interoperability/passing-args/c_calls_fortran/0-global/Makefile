all:
	gfortran -c ffuncs.f90 -o ffuncs.o -cpp -fmax-errors=1 -fcheck=all -O0 -g -fPIC
	gcc -c main.c -o main.o -fmax-errors=1 -O0 -g -fPIC -cpp
	gfortran ffuncs.o main.o -o main.elf
