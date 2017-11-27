module mfstdout
  use iso_c_binding
  implicit none
  interface
    function stdout_ptr() bind(c,name='stdout_ptr') result(ptr)
      use iso_c_binding
      type(c_ptr) :: ptr
    end function
  end interface
  interface
    function fprintf(fileptr, string) bind(c,name='fprintf')
      use iso_c_binding
      integer(c_int) fprintf
      type(c_ptr), value :: fileptr
      character(kind=c_char), dimension(*) :: string
    end function
  end interface
end module
program teststdout
use mfstdout
use iso_c_binding
implicit none
integer(c_int) ncharprinted
ncharprinted=fprintf(stdout_ptr(),'print*, fprintf(stdout_ptr(),string):'//c_new_line)
print*, ncharprinted
end program
