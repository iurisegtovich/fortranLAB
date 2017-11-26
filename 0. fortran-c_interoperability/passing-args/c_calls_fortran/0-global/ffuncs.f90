module ffuncs
use iso_c_binding
implicit none
integer(c_int), target, bind(c, name="a") :: a=0
integer(c_int), target, bind(c, name="b") :: b(3)=[1,2,3]
contains
subroutine ffunc_a() bind(c,name="ffunc_a")
  print*, __FILE__,":",__LINE__,":","c_loc(a):",c_loc(a)
  print*, __FILE__,":",__LINE__,":","a:",a
  a=a+1
  print*, __FILE__,":",__LINE__,":","c_loc(a):",c_loc(a)
  print*, __FILE__,":",__LINE__,":","a:",a
end subroutine
subroutine ffunc_b() bind(c,name="ffunc_b")
  print*, __FILE__,":",__LINE__,":","c_loc(b):",c_loc(b)
  print*, __FILE__,":",__LINE__,":","b:",b
  b=b+3
  print*, __FILE__,":",__LINE__,":","c_loc(b):",c_loc(b)
  print*, __FILE__,":",__LINE__,":","b:",b
end subroutine
end module
