!https://www.gnu.org/software/gsl/manual/html_node/An-Example-Program.html

PROGRAM main

use ISO_FORTRAN_ENV
use iso_c_binding

use fgsl

implicit none

interface
  function BESSELJ0(x) BIND(c, NAME='gsl_sf_bessel_J0') result(y)
    use iso_c_binding
    real(c_double), value :: x
    real(c_double) :: y
  end function
end interface

  real(REAL64), parameter :: x = 5.0
  real(REAL64) :: ygsl, yfgsl

  ygsl= BESSELJ0(x)
  yfgsl = fgsl_sf_bessel_jc0(x)

  write(*,*) "J0(",x,") = ", ygsl, yfgsl

END PROGRAM
