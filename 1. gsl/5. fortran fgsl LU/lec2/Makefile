#https://www.gnu.org/software/gsl/manual/html_node/Compiling-and-Linking.html#Compiling-and-Linking

static:
	#compile                      # path/to/header files
	#gfortran -fmax-errors=1 -Wall -c main.f90 -o main.o #-I/usr/local/include
	gfortran $$(pkg-config --cflags fgsl) -c main.f90 -o main.o
#	`pkg-config --libs fgsl`
	#link (static)
	gfortran -static main.o -lgsl -lgslcblas -o main.static.elf $$(pkg-config --libs fgsl) #?-L/usr/local/lib
	#test
	#./main.static.elf
