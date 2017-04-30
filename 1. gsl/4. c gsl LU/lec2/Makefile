#https://www.gnu.org/software/gsl/manual/html_node/Compiling-and-Linking.html#Compiling-and-Linking

static:
	#compile                      # path/to/header files
	gcc -Wall -c main.c -o main.o #-I/usr/local/include
	#link (static)
	gcc -static main.o -lgsl -lgslcblas -lm -o main.static.elf #?-L/usr/local/lib
	#test
	#./main.static.elf
