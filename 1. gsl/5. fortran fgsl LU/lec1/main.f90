!https://www.gnu.org/software/gsl/manual/html_node/An-Example-Program.html

!//http://www2.lawrence.edu/fast/GREGGJ/CMSC210/systems/systems.html


PROGRAM main

use ISO_FORTRAN_ENV
use iso_c_binding

use fgsl

implicit none

!!    // Declare pointer variables for a gsl vector and a matrix
!    gsl_vector *b;
  type(fgsl_vector) :: b !fgsl vector type !<= abstraction interface fortran-gsl
  real(fgsl_double) :: bf(3)  !<= actual fortran matrix, with interoperable real kind

!    gsl_matrix *A;
  type(fgsl_matrix) :: a !fgsl matrix type !<= abstraction interface fortran-gsl
  real(fgsl_double), target :: af(3, 3) !<= actual fortran matrix, with interoperable real kind

  integer(fgsl_int) :: status

!    // Create the vector and the matrix

!    b = gsl_vector_alloc (3);
  b = fgsl_vector_init(1.0_fgsl_double)

!    A = gsl_matrix_alloc(3, 3);
  a = fgsl_matrix_init(1.0_fgsl_double)

!    // load them with values
!    gsl_vector_set(b, 0, 0.0);
!    gsl_vector_set(b, 1, 4.0);
!    gsl_vector_set(b, 2, -2.0);
  bf = [1.0d0, 2.0d0, 3.0d0]
  status = fgsl_vector_align(bf, 3_fgsl_size_t, b, 3_fgsl_size_t, &
       0_fgsl_size_t, 1_fgsl_size_t)

!    gsl_matrix_set(A,0,0,1.0);
!    gsl_matrix_set(A,0,1,-2.0);
!    gsl_matrix_set(A,0,2,1.0);
!    gsl_matrix_set(A,1,0,2.0);
!    gsl_matrix_set(A,1,1,3.0);
!    gsl_matrix_set(A,1,2,-1.0);
!    gsl_matrix_set(A,2,0,3.0);
!    gsl_matrix_set(A,2,1,1.0);
!    gsl_matrix_set(A,2,2,-2.0);
  af = reshape([ 1.0d0, 1.0d0, 0.0d0, 1.0d0, 0.0d0, 1.0d0, &
       0.0d0, 2.0d0, 1.0d0 ], [3, 3])
  status = fgsl_matrix_align(af, 3_fgsl_size_t, 3_fgsl_size_t, &
       3_fgsl_size_t,a)

!    // Print them
    print*, "The vector:"
!   gsl_vector_fprintf(stdout, b, "%f");
    print*, bf !print with fortran' intrinsic print using fortran native pointer bf
    print*, "The matrix:"
!    fgsl_matrix_fprintf(stdout, A, "%f");
    print*, af !print with fortran' intrinsic print using fortran native pointer af
    
!    // Clean up
    call fgsl_vector_free(b)
    print*, "fgsl_vector_free(b) => success"
    call fgsl_matrix_free(a)
    print*, "fgsl_matrix_free(a) => success"
    
END PROGRAM
