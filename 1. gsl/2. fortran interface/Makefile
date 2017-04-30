#https://www.gnu.org/software/gsl/manual/html_node/Compiling-and-Linking.html#Compiling-and-Linking

all:
	#compile                      # path/to/header files
	gfortran -fmax-errors=1 -Wall -c main.f90 -o main.o #-I/usr/local/include
	#link (static)
	gfortran -static main.o -lgsl -lgslcblas -o main.static.elf #?-L/usr/local/lib
	#test
	#./main.static.elf
	#link (shared)
	gfortran main.o -lgsl -lgslcblas -o main.shared.elf #?-L/usr/local/lib
	#test
	##LD_LIBRARY_PATH=/usr/local/lib
	##export LD_LIBRARY_PATH
	#./main.shared.elf


