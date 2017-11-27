test:
	gcc -c stdout_ptr.c -o stdout_ptr.o -cpp
	gfortran -c  main.f90 -o main.o -cpp
	gfortran main.o stdout_ptr.o -o main.elf
