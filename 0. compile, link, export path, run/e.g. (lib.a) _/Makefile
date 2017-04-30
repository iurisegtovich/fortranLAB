COMPILE = /usr/bin/gfortran
FCOPTS = -g -Wall -fbounds-check -cpp -fmax-errors=1 -ffree-line-length-0 #DEBUG
LINK = /usr/bin/gfortran
default:
	$(COMPILE) $(FCOPTS) -c lib1/f90/lib1.f90 -Jlib1/mod -o lib1/o/lib1.o
	$(COMPILE) $(FCOPTS) -c main/f90/main.f90 -Ilib1/mod -o main/o/main.o
	ar rcv lib1/a/lib1.a lib1/o/lib1.o
	ranlib lib1/a/lib1.a
	$(LINK) -o main/elf/main.elf main/o/main.o lib1/a/lib1.a
