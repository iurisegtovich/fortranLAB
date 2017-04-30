module mfstdout
    use iso_c_binding
interface
  function fptrstdout() bind(c,name='ptrstdout') result(ptr)
    use iso_c_binding
    type(c_ptr) :: ptr
  end function
end interface

type(c_ptr) :: fstdout

end module
