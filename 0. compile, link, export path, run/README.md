#https://www.cs.swarthmore.edu/~newhall/unixhelp/howto_C_libraries.html
#http://unix.stackexchange.com/questions/22926/where-do-executables-look-for-shared-objects-at-runtime
#http://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html

.h and .mod are required when compiling .f90 or .c into .o
according to USE or INCLUDE statements

ensure they are automatically found using the option -Idir/dir

.a and .so are required when linking .o into .elf

# -Ldir
  Tells the linker to consider this dir when searching for libraries

# -l:lib.so
# -l:lib.so.1
  Tells the linker to search for this library.version when linking
  
#-soname
  Every shared library has a special name called the ``soname''. The soname has the prefix ``lib'', the name of the library, the phrase ``.so'', followed by a period and a version number that is incremented whenever the interface changes (as a special exception, the lowest-level C libraries don't start with ``lib''). A fully-qualified soname includes as a prefix the directory it's in; on a working system a fully-qualified soname is simply a symbolic link to the shared library's ``real name''.
  
# -Wl
  pass information to the linker
  You pass the soname using the -Wl gcc option. The -Wl option passes options along to the linker (in this case the -soname linker option) - the commas after -Wl are not a typo, and you must not include unescaped whitespace in the option.
  
#-rpath
  The rpath is stored in the executable (it's the DT_RPATH or DT_RUNPATH dynamic attribute). It can contain absolute paths or paths starting with $ORIGIN to indicate a path relative to the location of the executable (e.g. if the executable is in /opt/myapp/bin and its rpath is $ORIGIN/../lib:$ORIGIN/../plugins then the dynamic linker will look in /opt/myapp/lib and /opt/myapp/plugins). The rpath is normally determined when the executable is compiled, with the -rpath option to ld, but you can change it afterwards with chrpath.
  During development, there's the potential problem of modifying a library that's also used by many other programs -- and you don't want the other programs to use the ``developmental''library, only a particular application that you're testing against it. One link option you might use is ld's ``rpath'' option, which specifies the runtime library search path of that particular program being compiled. From gcc, you can invoke the rpath option by specifying it this way: 
  
#-static
  -static
    On systems that support dynamic linking, this prevents linking with the shared libraries.  On other systems, this option has
    no effect.

#-shared
  ?
  
# ldconfig
  ?
  
# export
  ?
  
#-fpic
#-fPIC
  -fpic
    Generate position-independent code (PIC) suitable for use in a shared library, if supported for the target machine.  Such
     code accesses all constant addresses through a global offset table (GOT).  The dynamic loader resolves the GOT entries when
     the program starts (the dynamic loader is not part of GCC; it is part of the operating system).  If the GOT size for the
     linked executable exceeds a machine-specific maximum size, you get an error message from the linker indicating that -fpic
     does not work; in that case, recompile with -fPIC instead.  (These maximums are 8k on the SPARC and 32k on the m68k and
     RS/6000.  The 386 has no such limit.)

     Position-independent code requires special support, and therefore works only on certain machines.  For the 386, GCC supports
     PIC for System V but not for the Sun 386i.  Code generated for the IBM RS/6000 is always position-independent.

     When this flag is set, the macros "__pic__" and "__PIC__" are defined to 1.

  -fPIC
    If supported for the target machine, emit position-independent code, suitable for dynamic linking and avoiding any limit on
    the size of the global offset table.  This option makes a difference on the m68k, PowerPC and SPARC.

    Position-independent code requires special support, and therefore works only on certain machines.

    When this flag is set, the macros "__pic__" and "__PIC__" are defined to 2.

.so is always required when executing .elf

#THE ORDER OF THE LIBRARIES IN THE COMMAND LINE FOR LINKING !!!DOES!!! MATTER



