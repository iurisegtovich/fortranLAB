!  TOC:

!  byval
!  byref

!  scalar
!  array
!    dimension(1)
!    static (10)
!    dynamic (:)
!    matrix (i,j) <-> (j,i)
!  cchar
!  string

!  global
!  sub in
!  sub out
!  sub inout
!  func

!  pure
!  collateral
!  recursive
!  functional

module testmod

  use iso_c_binding
  use iso_fortran_env

  implicit none
  !>>PARAMETER attribute conflicts with BIND(C)
  real(c_double), bind(c) :: a=653.
  real(c_double), bind(c), dimension(3) :: b=[1.,2.,3.]

contains

    subroutine testcommon(a_out,b_out) bind(c, name = "testcommon")
      real(c_double) :: a_out
      real(c_double) :: b_out(3)
      a_out=a
      b_out=b
    end subroutine

    subroutine testhw() bind(c, name = "testhw")
      a=a+1.
      b=b+1.
    end subroutine

    pure function testfunctionbyval(x) result(y) bind(c, name = "testfunctionbyval")
      real(c_double), intent(in), value :: x
      real(c_double) :: y
      y=sin(x)
    end function

    function testfunctionbyref(x) result(y) bind(c, name = "testfunctionbyref")
      real(c_double), intent(in) :: x
      real(c_double) :: y
      y=sin(x)
    end function

    function testfunction2(x) result(y) bind(c, name = "testfunction2")
      real(c_double), dimension(:), intent(in) :: x
      real(c_double) :: y
      integer :: i
      y=0
      do i = 1, size(x)
        y=y+dlog(x(i))
      enddo
    end function

    subroutine testsub(x,y) bind(c, name = "testsub")
      real(c_double), intent(in) :: x
      real(c_double), intent(out) :: y
      y=sin(x)
    end subroutine

    subroutine testsubval(x1,x2,x3,x4) bind(c, name = "testsubval")
      real(c_double), intent(in), value :: x1,x2,x3,x4
      a=x1
      b(1)=x2
      b(2)=x3
      b(3)=x4
    end subroutine

    subroutine testsub2(y) bind(c, name = "testsub2")
      real(c_double), dimension(10) :: y
      y=[1,2,3,4,5,6,7,8,9,10]
    end subroutine
    
    subroutine testsub3(x,y) bind(c, name = "testsub3")
      real(c_double), dimension(10) :: x
      real(c_double), dimension(10) :: y
      integer(c_int) :: i
      integer :: fnum
      y=-1
      open(newunit=fnum,file='testsub3.dat',action='write',status='replace')
      write(fnum,*) "x(i)"
      flush(fnum)
      do i = 1, 10
        write(fnum,*) i, x(i)
        write(fnum,*) "next"
        flush(fnum)
      enddo
      close(fnum)
      y=2*x
    end subroutine

    subroutine testsizearrayn(n,x,y) bind(c, name = "testsizearrayn")
      !EXPLICIT SHAPE PASSED VIA N
      integer(c_int), value, intent(in) :: n
      !EXPLICIT SHAPE USED HERE
      integer(c_int), intent(in) :: x(n)
      integer(c_int), intent(out) :: y
      y=x(n)
    end subroutine

    subroutine testsizearray1(x,y) bind(c, name = "testsizearray1")
      !ASSUMED SHAPE - NOT INTEROPERABLE
      integer(c_int), intent(in) :: x(:)
      integer(c_int), intent(out) :: y
      integer(c_int) :: i
      integer :: fnum
      y=-1
      open(newunit=fnum,file='testsizearray1.dat',action='write',status='replace')
      write(fnum,*) "x(i)"
      flush(fnum)
      do i = 1, 15
        write(fnum,*) x(i)
        write(fnum,*) "next"
        flush(fnum)
      enddo
!      y=x(1)
      close(fnum)
    end subroutine

    subroutine testsizearray2(x,y) bind(c, name = "testsizearray2")
      !ASSUMED SIZE -see the fortran 2003 handbook, works, but can't infer the size/shape anyways
      integer(c_int), intent(in) :: x(*)
      integer(c_int), intent(out) :: y
      integer(c_int) :: i
      integer :: fnum
      y=-1
      open(newunit=fnum,file='testsizearray2.dat',action='write',status='replace')
      write(fnum,*) "x(i)"
      flush(fnum)
      do i = 1, 15
        write(fnum,*) x(i)
        write(fnum,*) "next"
        flush(fnum)
      enddo
      y=x(1)
      close(fnum)
      !output
      !          -1
      !          -2
      !          -3
      !          -4
      !          -5
      !          -6
      !          -7
      !          -8
      !          -9
      !         -10
      !  -825712968
      !       32554
      !   -90621408
      !       32554
      !   -90621728
    end subroutine

    subroutine testsizearray3(x,y) bind(c, name = "testsizearray3")
      !ASSUMED SIZE -see the fortran 2003 handbook, works, but can't infer the size/shape anyways
      integer(c_int), intent(in) :: x(*)
      integer(c_int), intent(out) :: y
      integer(c_int) :: i
      integer :: fnum
      y=-1
      open(newunit=fnum,file='testsizearray3.dat',action='write',status='replace')
      write(fnum,*) "x(i)"
      flush(fnum)
      do i = 1, 15
        write(fnum,*) x(i)
        write(fnum,*) "next"
        flush(fnum)
      enddo
      y=x(1)
      close(fnum)
    end subroutine

    subroutine testsizearray3b(n,x,y) bind(c, name = "testsizearray3b")
      integer(c_int), intent(in), value :: n
      real(c_double), dimension(n), intent(in) :: x
      integer(c_int), intent(out) :: y
      integer(c_int) :: i
      integer :: fnum
      y=-1
      open(newunit=fnum,file='testsizearray3b.dat',action='write',status='replace')
      write(fnum,*) "x(i)"
      flush(fnum)
      do i = 1, n
        write(fnum,*) i, x(i)
        write(fnum,*) "next"
        flush(fnum)
      enddo
      y=x(1)
      close(fnum)
    end subroutine
    
    subroutine testhelloworld(n,s,a) bind(c, name = "testhelloworld")
      integer(c_int), intent(in), value :: n
      !hold space for the nullchar
      character(c_char), dimension(n+1), intent(in) :: s
      character(c_char), intent(in) :: a
      integer(c_int) :: i
      integer :: fnum
      open(newunit=fnum,file='testhelloworld.dat',action='write',status='replace')
      write(fnum,*) "s(i)"
      flush(fnum)
      do i = 1, n !+1
        write(fnum,*) i, s(i)
        write(fnum,*) "next"
        flush(fnum)
      enddo
      write(fnum,*) "a"
      write(fnum,*) a
      flush(fnum)
!      write(fnum,*) "c_null_char"
!      write(fnum,*) c_null_char
      close(fnum)
    end subroutine
    
    subroutine testanswer(n,s,a) bind(c, name = "testanswer")
      !ASSUMED SIZE -see the fortran 2003 handbook, works, but can't infer the size/shape anyways
      integer(c_int), intent(in), value :: n
      !hold space for the nullchar
      character(c_char), dimension(n+1), intent(inout) :: s
      character(c_char), intent(inout) :: a
      integer(c_int) :: i
      integer :: fnum
      character(len=*), parameter :: answer="holamundo!"

      open(newunit=fnum,file='testanswer.dat',action='write',status='replace')
      write(fnum,*) "s(i)"
      flush(fnum)
      do i = 1, n !+1
        write(fnum,*) i, s(i), answer(i:i)
        write(fnum,*) "next"
        flush(fnum)
      enddo
      write(fnum,*) "a"
      write(fnum,*) a
      flush(fnum)
!      write(fnum,*) "c_null_char"
!      write(fnum,*) c_null_char
      close(fnum)
      
      do i = 1,n
        s(i)=answer(i:i)
      enddo
      a="b"
    end subroutine
    
    subroutine testallocatable(n,c_array_ptr) bind(c, name = "testallocatable")
      integer(c_int), intent(inout) :: n
      type(c_ptr), intent(inout) :: c_array_ptr(:)
      integer (c_int), allocatable, dimension (:), target, save :: FortArray

   allocate (FortArray (1:2) )
   FortArray = [ 2.5_c_float, 4.4_c_float ]

   c_array_ptr = c_loc (FortArray)

    end subroutine
    
end module
