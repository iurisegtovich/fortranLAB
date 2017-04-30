program teststdout

use mfstdout

!test example, usage along program
implicit none

interface
  function fprintf(fileptr, string) bind(c,name='fprintf')
    use iso_c_binding
    integer(c_int) fprintf
    type(c_ptr), value :: fileptr
    character(kind=c_char), dimension(*) :: string
  end function
end interface

fstdout = fptrstdout()

print*, fprintf(fstdout,'print*, fprintf(fstdout,string)'//c_new_line)


end program
