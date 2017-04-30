#https://www.gnu.org/software/gsl/manual/html_node/Compiling-and-Linking.html#Compiling-and-Linking

all:
	#compile                      # path/to/header files
	gcc -Wall -c main.c -o main.o #-I/usr/local/include
	#link (static)
	gcc -static main.o -lgsl -lgslcblas -lm -o main.static.elf #?-L/usr/local/lib
	#test
	#./main.static.elf
	#link (shared)
	gcc main.o -lgsl -lgslcblas -lm -o main.shared.elf #?-L/usr/local/lib
	#test
	##LD_LIBRARY_PATH=/usr/local/lib
	##export LD_LIBRARY_PATH
	#./main.shared.elf


