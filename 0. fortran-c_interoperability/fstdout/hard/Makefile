lib:
#	gfortran $$(pkg-config --cflags fgsl) -c main.f90 -o main.o -fmax-errors=1
	gcc -c stdout.f90.to.c 
	gfortran -c stdout.c.to.f90
	gfortran -c test_fstdout.f90

test: lib
#	gfortran -static main.o -lgsl -lgslcblas -o main.static.elf $$(pkg-config --libs fgsl) #?-L/usr/local/lib
	gfortran test_fstdout.o stdout.c.to.o stdout.f90.to.o

#run: test
#	./a.out
##print*, fprintf(fstdout,string)
##          32
 

