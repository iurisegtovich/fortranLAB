module ffuncs
use iso_c_binding
implicit none
integer(c_int), target, bind(c, name="a") :: a=0
integer(c_int), target, bind(c, name="b") :: b(3)=[1,2,3]
contains
subroutine ffunc_a(a) bind(c,name="ffunc_a")
!  integer, value, target, intent(in) :: a CONSIDER USING INTENT(IN) FOR EXTRA SAFETY CHECKS
  integer, value, target :: a
  print*, __FILE__,":",__LINE__,":","c_loc(a):",c_loc(a)
  print*, __FILE__,":",__LINE__,":","a:",a
  a=a+1
  print*, __FILE__,":",__LINE__,":","c_loc(a):",c_loc(a)
  print*, __FILE__,":",__LINE__,":","a:",a
end subroutine
subroutine ffunc_aa(a) bind(c,name="ffunc_aa")
!  integer, value, target, intent(in) :: a CONSIDER USING INTENT(IN) FOR EXTRA SAFETY CHECKS
  integer, value, target :: a
  print*, __FILE__,":",__LINE__,":","c_loc(a):",c_loc(a)
  print*, __FILE__,":",__LINE__,":","a:",a
  a=a+1
  print*, __FILE__,":",__LINE__,":","c_loc(a):",c_loc(a)
  print*, __FILE__,":",__LINE__,":","a:",a
end subroutine
subroutine ffunc_aaa(a) bind(c,name="ffunc_aaa")
!  integer, value, target, intent(in) :: a CONSIDER USING INTENT(IN) FOR EXTRA SAFETY CHECKS
  integer, value, target :: a
  print*, __FILE__,":",__LINE__,":","c_loc(a):",c_loc(a)
  print*, __FILE__,":",__LINE__,":","a:",a
  a=a+1
  print*, __FILE__,":",__LINE__,":","c_loc(a):",c_loc(a)
  print*, __FILE__,":",__LINE__,":","a:",a
end subroutine
subroutine ffunc_b(b) bind(c,name="ffunc_b")
  integer, target, intent(out) :: b
  print*, __FILE__,":",__LINE__,":","c_loc(b):",c_loc(b)
  print*, __FILE__,":",__LINE__,":","b:",b
  b=1411
  print*, __FILE__,":",__LINE__,":","c_loc(b):",c_loc(b)
  print*, __FILE__,":",__LINE__,":","b:",b
end subroutine
subroutine ffunc_bb(b) bind(c,name="ffunc_bb")
  integer, target, intent(out) :: b
  print*, __FILE__,":",__LINE__,":","c_loc(b):",c_loc(b)
  print*, __FILE__,":",__LINE__,":","b:",b
  b=1411
  print*, __FILE__,":",__LINE__,":","c_loc(b):",c_loc(b)
  print*, __FILE__,":",__LINE__,":","b:",b
end subroutine
subroutine ffunc_bbb(b) bind(c,name="ffunc_bbb")
  integer, target, intent(out) :: b
  print*, __FILE__,":",__LINE__,":","c_loc(b):",c_loc(b)
  print*, __FILE__,":",__LINE__,":","b:",b
  b=1411
  print*, __FILE__,":",__LINE__,":","c_loc(b):",c_loc(b)
  print*, __FILE__,":",__LINE__,":","b:",b
end subroutine
end module
