!draft on how to create a type definition to hold a list of pointers to functions with a common interface
!
!build with
!  gfortran -fmax-errors=1 main.f90 -fcheck=all -Wall
!run with
!  ./a.out


program main               !

implicit none                                                   !



  interface                                               ! begin interface block
    function fun_interface(x) result(y)                         !function header: name of the interface for the many functions
      integer x, y                              !function header: arguments
    end function                                      !function header: end
  end interface                                           ! END interface block

type ptr_func_list !typedef                                          !type definition to be alocated for as many functions as desired
  procedure(fun_interface), pointer, nopass :: fun => null()               !pointer to any function that must match the interface named  "fun_interface" -- every element of the allocatable ptr_func_list will contain a pointer pointing to one of the desired functions -- init it pointing to null() so you get a segfault core dumped instead of a HEISENBUG -- each of the functions "fun1, fun2 fun3" which will be called by the generic name "fun"
end type                                                        !END of type definition

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11[]

integer i                                                        ! i will use this for a loop later

type(ptr_func_list), allocatable :: minha_lista(:)              ! create a variable with allocatable to be the list of pointer to functions
allocate(minha_lista(3))                                        ! allocate it with size equal to the number of functions you have

minha_lista(1)%fun => fun2                                   ! initialization: point each ptr to one of your desired functions
minha_lista(2)%fun => fun3
minha_lista(3)%fun => fun4

do i = 1 , 3
  print*, minha_lista(1)%fun(x=i)   !NOW YOU CAN CALL EACH FUCNTION ACCORDING TO YOUR INDEXES
enddo


contains !these below are the actual functions that you might have implemented and want to assemble in the list

  function fun2(x) result(y)
    integer x, y
    y=x**2+x+2
  end function

  function fun3(x) result(y)
    integer x, y
    y=x**3+x*3
  end function

  function fun4(x) result(y)
    integer x, y
    y=x**4+x/4
  end function

end program
