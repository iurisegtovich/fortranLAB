!source: http://www.44342.com/fortran-f849-t9703-p1.htm
module mfpipes
  
  use, intrinsic :: ISO_C_BINDING
  
  !=================================================================================================
  
  type, public :: streampointer
    type (c_ptr) :: handle = c_null_ptr
  end type streampointer
  
  !=================================================================================================
  
! popen  
  interface
    function popen(path, mode) bind(C, name='popen')
      use, intrinsic :: ISO_C_BINDING
      type (c_ptr) :: popen
      character(kind=c_char), dimension(*) :: path, mode
    end function
  end interface
  
  !=================================================================================================
  
! fopen  
  interface
    function fopen(path, mode) bind(C, name='fopen')
      use, intrinsic :: ISO_C_BINDING
      type (c_ptr) :: fopen
      character(kind=c_char), dimension(*) :: path, mode
    end function
  end interface
  
  !=================================================================================================
  
! fgets  
  interface
    function fgets(buf, siz, handle) bind(C, name='fgets')
      use, intrinsic :: ISO_C_BINDING
      type (c_ptr) :: fgets
      character(kind=c_char), dimension(*) :: buf
      integer(kind=c_int), value :: siz
      type (c_ptr), value :: handle
    end function
  end interface
  
  !=================================================================================================
  
! pclose  
  interface
    function pclose(handle) bind(C, name='pclose')
    use, intrinsic :: ISO_C_BINDING
    integer(c_int) :: pclose
    type (c_ptr), value :: handle
    end function
  end interface
  
  !=================================================================================================
  
! fprintf  
  interface
    function fprintf(fileptr, string) bind(C, name='fprintf')
      use, intrinsic :: ISO_C_BINDING
      integer(c_int) :: fprintf ! Upon successful completion, these functions return the number of bytes transmitted excluding the terminating null in the case of sprintf() or snprintf() or a negative value if an output error was encountered. 
      type (c_ptr), value :: fileptr
      character(kind=c_char), dimension(*) :: string
    end function
  end interface
  
  !=================================================================================================
  
! fflush  
  interface
    function fflush(fileptr) bind(C, name='fflush')
      use, intrinsic :: ISO_C_BINDING
      integer(c_int) :: fflush ! Upon successful completion, these functions return the number of bytes transmitted excluding the terminating null in the case of sprintf() or snprintf() or a negative value if an output error was encountered. 
      type (c_ptr), value :: fileptr
    end function
  end interface
  
  !=================================================================================================
  
end module mfpipes
program main
use mfpipes
implicit none
  integer :: fnum
  integer :: i
  type(streampointer) :: fp
  integer :: ios
  fp%handle=popen( c_char_"gnuplot -persistent" //C_NULL_CHAR, "w" // C_NULL_CHAR)
  ios=fprintf(fp%handle,c_char_"set terminal wxt enhanced"//char(10)//C_NULL_CHAR)
  open( newunit = fnum, file = 'main.dat', action = 'write', status = 'replace')
  do i = 0, 3
    write(fnum,*) i,dexp(0.1d0*dfloat(i))
    flush(fnum)
    write(*,*) i,dexp(0.1d0*dfloat(i))
    flush(6)
    call execute_command_line("sleep 0.1")
  enddo
  ios=fprintf(fp%handle,c_char_"plot 'main.dat'"//char(10)//C_NULL_CHAR)
  ios=fflush(fp%handle)
  do i = 4, 100
    write(fnum,*) i,dexp(0.1d0*dfloat(i))
    flush(fnum)
    write(*,*) i,dexp(0.1d0*dfloat(i)), "To kill me use 'CTRL+Z', then 'kill %1'"
    flush(6)
    call execute_command_line("sleep 0.2")
    ios=fprintf(fp%handle,c_char_"replot "//char(10)//C_NULL_CHAR)
!    ios=fprintf(fp%handle,c_char_"refresh "//char(10)//C_NULL_CHAR)
    ios=fflush(fp%handle)
  enddo
  close( fnum )
  ios=pclose(fp%handle)
end program
