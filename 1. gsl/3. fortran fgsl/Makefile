#https://www.gnu.org/software/gsl/manual/html_node/Compiling-and-Linking.html#Compiling-and-Linking

all:
	#compile                      # path/to/header files
	#gfortran -fmax-errors=1 -Wall -c main.f90 -o main.o #-I/usr/local/include
	gfortran $$(pkg-config --cflags fgsl) -c main.f90 -o main.o
#	`pkg-config --libs fgsl`
	#link (static)
	gfortran -static main.o -lgsl -lgslcblas -o main.static.elf $$(pkg-config --libs fgsl) #?-L/usr/local/lib
	#test
	#./main.static.elf
	#link (shared)
	gfortran main.o -lgsl -lgslcblas -o main.shared.elf $$(pkg-config --libs fgsl) #?-L/usr/local/lib
	#test
	##LD_LIBRARY_PATH=/usr/local/lib # <- gottta run this line on your shell, simply uncommenting it here won't do it
	##export LD_LIBRARY_PATH # <- gottta run this line on your shell, simply uncommenting it here won't do it
	#./main.shared.elf

#(D) usage:

#It is recommended that you obtain the necessary flags to compile with FGSL support
#through pkg-config:
#$F90 -o myprog.exe `pkg-config --cflags fgsl` myprog.f90 \
#	`pkg-config --libs fgsl`
