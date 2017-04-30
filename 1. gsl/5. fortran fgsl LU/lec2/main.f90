!https://www.gnu.org/software/gsl/manual/html_node/An-Example-Program.html

!//http://www2.lawrence.edu/fast/GREGGJ/CMSC210/systems/systems.html


PROGRAM main

use ISO_FORTRAN_ENV
use iso_c_binding

use fgsl

implicit none

!//http://www2.lawrence.edu/fast/GREGGJ/CMSC210/systems/systems.html

!    // Declare pointer variables for two gsl vectors, a matrix,
!    // and a permutation list

!    gsl_vector *b, *x;
  type(fgsl_vector) :: b
  real(fgsl_double) :: bf(3)
  type(fgsl_vector) :: x
  real(fgsl_double) :: xf(3)

!    gsl_matrix *A;
  type(fgsl_matrix) :: a
  real(fgsl_double), target :: af(3, 3)

!    gsl_permutation *p;
  type(fgsl_permutation) :: p
  
!    int s;
  integer(fgsl_int) :: status
  integer(fgsl_int) :: s
  integer(fgsl_int) :: signum

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
       
!    // Solve the system A x = b
!    // Start by creating a vector to receive the result
!    // and a permutation list to pass to the LU decomposition
!    x = gsl_vector_alloc(3);
  x = fgsl_vector_init(1.0_fgsl_double)
  xf = [0.0d0, 0.0d0, 0.0d0]
  status = fgsl_vector_align(xf, 3_fgsl_size_t, x, 3_fgsl_size_t, &
       0_fgsl_size_t, 1_fgsl_size_t)
       
!    p = gsl_permutation_alloc(3);
  p = fgsl_permutation_alloc(3_fgsl_size_t)

!    // Do the LU decomposition on A and use it to solve the system
!    gsl_linalg_LU_decomp(A, p, &s);
  status = fgsl_linalg_lu_decomp(a, p, signum)
  print*, status==fgsl_success

!    gsl_linalg_LU_solve(A, p, b, x);
  print*, 'x0', xf
  status = fgsl_linalg_lu_solve(a, p, b, x)
  print*, status==fgsl_success
  
!    // Print the result
    print*, "The solution:"

!    gsl_vector_fprintf(stdout, x, "%f");
  print*, 'xf', xf
  
!    // Clean up
    call fgsl_vector_free(b)
    call fgsl_vector_free(x)
    call fgsl_permutation_free(p)
    call fgsl_matrix_free(a)
    print*, "all clear"
END PROGRAM
