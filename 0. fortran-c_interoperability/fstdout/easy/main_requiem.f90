module mfstdout
  use iso_c_binding
  implicit none
  interface
    function stdout_ptr() bind(c,name='stdout_ptr') result(ptr)
      use iso_c_binding
      type(c_ptr) :: ptr
    end function
  end interface
!  type(c_ptr), BIND(c,name='stdout') :: cstdout !this has the opposite of the desired effect, it overrides the c name stdout with this newly created wild pointer
end module
program teststdout
use mfstdout
use iso_c_binding
implicit none
interface
  function fprintf(fileptr, string) bind(c,name='fprintf')
    use iso_c_binding
    integer(c_int) fprintf
    type(c_ptr), value :: fileptr
    character(kind=c_char), dimension(*) :: string
  end function
end interface
print*, __FILE__, __LINE__
fstdout=fptrstdout()
print*, __FILE__, __LINE__
print*, fprintf(fstdout,c_new_line//'print*, fprintf(fstdout,string)'//c_new_line)
print*, __FILE__, __LINE__
print*, fprintf(fptrstdout(),'print*, fprintf(fptrstdout(),string)'//c_new_line)
end program
