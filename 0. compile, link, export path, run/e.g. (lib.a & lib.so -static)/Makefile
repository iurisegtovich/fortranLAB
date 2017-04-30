#TRY ME USING "make -i"

#REF1 - https://www.cs.swarthmore.edu/~newhall/unixhelp/howto_C_libraries.html
#REF2 - http://unix.stackexchange.com/questions/22926/where-do-executables-look-for-shared-objects-at-runtime
#REF3 - http://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html

COMPILE = /usr/bin/gfortran
FCOPTS = -g -Wall -fbounds-check -cpp -fmax-errors=1 -ffree-line-length-0 #DEBUG

LINK = /usr/bin/gfortran
default:
	######################################################################
	#
	# DEFAULT ------------------------------------------------------------
	#
	$(COMPILE) $(FCOPTS) -fPIC -c lib1/f90/lib1.f90 -Jlib1/mod -o lib1/o/lib1.o #-fPIC ???
	$(COMPILE) $(FCOPTS) -c main/f90/main.f90 -Ilib1/mod -o main/o/main.o
	$(LINK) -shared -o lib1/a\&so/lib1.so lib1/o/lib1.o # -shared ???
	ar rcv lib1/a\&so/lib1.a lib1/o/lib1.o
	ranlib lib1/a\&so/lib1.a
	$(LINK) -o main/elf/shared/main.elf main/o/main.o -Llib1/a\&so -l1
	$(LINK) -static -o main/elf/static/main.elf main/o/main.o -Llib1/a\&so -l1
	#
	# LINK SUCCESSFUL ----------------------------------------------------
	#
