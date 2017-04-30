# GOAL: Determine a set of libraries providing basic to advanced scientific computing / numerical analysis tools accessible form fortran (targeting gnu/linux)

## REF: Wikipedia / List of numerical libraries
>- https://en.wikipedia.org/wiki/List_of_numerical_libraries#Fortran

> ?	PRETTY BUT INCONCLUSIVE

* HIGHLIGHTS
  * fortran-fortran
    *	BLAS (Basic Linear Algebra Subprograms) is a de facto application programming interface standard for publishing libraries to perform basic linear algebra operations such as vector and matrix multiplication.

    * LAPACK, the Linear Algebra PACKage, is a software library for numerical computing originally written in FORTRAN 77 and now written in Fortran 90.
    >- LAPACK contains BLAS
    >- GLS contains/replaces(not quite efficiently) LAPACK (?)
    
	* Netlib is a repository of scientific computing software which contains a large number of separate programs and libraries including BLAS, EISPACK, LAPACK and others.

    * Portable, Extensible Toolkit for Scientific Computation (PETSc), is a suite of data structures and routines for the scalable (parallel) solution of scientific applications modeled by partial differential equations.

    * SLATEC is a FORTRAN 77 library of over 1400 general purpose mathematical and statistical routines.

	>- Each subroutine in SLATEC is tagged as belonging to one of 13 subpackages. Some of these subpackages are also well known as free-standing FORTRAN subprogram libraries, including BLAS, EISPACK, FFTPACK, LINPACK and QUADPACK.
	
	>- The GNU Scientific Library (GSL), initiated in 1996 and stable since 2001, was started with the explicit aim to provide a more modern replacement for SLATEC.

	* (\$) The NAG Fortran Library is a collection of mathematical and statistical routines for Fortran.

	* (\$) IMSL Numerical Libraries are cross-platform libraries containing a comprehensive set of mathematical and statistical functions that can be embedded in a users application.

  * fortran-via-c
    * FFTW (Fastest Fourier Transform in the West) is a software library for computing Fourier and related transforms.

    * GNU Scientific Library, a popular, free numerical analysis library implemented in C.

    * (free to use) Intel MKL, Intel Math Kernel Library (in C), a library of optimized math routines for science, engineering, and financial applications, written in C/C++ and Fortran. Core math functions include BLAS, LAPACK, ScaLAPACK, sparse solvers, fast Fourier transforms, and vector math.

## REF: netlib
>- http://www.netlib.org/

> ?	SO CONFUSING

## REF: GSL
>- https://www.gnu.org/software/gsl/

* it
  ?	GSL requires a BLAS library for vector and matrix operations. The default CBLAS library supplied with GSL can be replaced by the tuned ATLAS library for better performance,
  ?	ATLAS - a portable self-optimising BLAS library with CBLAS interface
  ?	ATLAS is free software and its license is compatible with the GNU GPL.
Other packages that are useful for scientific computing are:
  ?	GLPK - GNU Linear Programming Kit

  ?	FFTW - Large-scale Fast Fourier Transforms

  ?	NLopt - nonlinear optimization with unconstrained, bound-constrained, and general nonlinear inequality constraints

  ?	All these packages are free software (GNU GPL/LGPL).

* Extensions/Applications
  * FGSL - Fortran interface to GSL (under development)

## REF: FGSL
>- https://www.lrz.de/services/software/mathematik/gsl/fortran/index.html
>- https://github.com/reinh-bader/fgsl

## REF: ATLAS
>- https://directory.fsf.org/wiki/ATLAS

## REF: GLPK

## REF: FFTW

## REF: NLOPT

## REF: PETSc
>- https://github.com/petsc/petsc

## REF: blas x cblas x lapack x lapacke
>- http://nicolas.limare.net/pro/notes/2014/10/31_cblas_clapack_lapacke/

* LAPACKE
  >- LAPACKE is to LAPACK what CBLAS is to BLAS
  >- LAPACKE is also included in the MKL package
 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
##REF:  suitesparse
##REF:  scalapack
##REF: ACML

## REF: GSL vs *PACKs
>- http://yetanothermathprogrammingconsultant.blogspot.com.br/2009/06/gsl-vs-lapack-performance.html
| library	| gsl |	lapack |
|:-:|:-:|:-:|
| routine	| gsl_linalg_LU_decomp +               gsl_linalg_LU_invert	| dgesv |

### math utah
https://www.math.utah.edu/software/gsl.html
EISPACK (for matrix eigenvalues and eigenvectors, and singular-value decompositions)
LINPACK (for linear equations, least-squares, and singular-value decomposition)
MINPACK (for function minimization and least-squares solutions), 
LAPACK (for linear equations, least-squares, singular-value decomposition, and eigenvalue/eigenvector solution).

### chpc utah
https://www.chpc.utah.edu/documentation/software/mathlibraries.php
GSL is a numerical library for C/C++ provides a wide range of mathematical routines such as random number generators, special functions and least-squares fitting. There are over 1000 functions in total with an extensive test suite. While GSL is not parallel, it is reasonably thread safe and its routines should be callable from parallel code sections. One can also link a parallel BLAS library such as MKL or ACML and utilize the shared memory parallelism they provide.
Automatically Tuned Linear Algebra Software (ATLAS) is an open source library aimed at providing portable performance solution. It provides full BLAS and certain LAPACK routines, which are being tuned to the computer platform at the compilation time. Since we provide vendor optimized BLAS such as the Intel MKL, we are deprecating ATLAS support. Relatively old versions of the library are located at/uufs/chpc.utah.edu/sys/pkg/atlas/std/lib.
LAPACK (Linear Algebra PACKage) provides routines for solving systems of simultaneous linear equations, least-squares solutions of linear systems of equations, eigenvalue problems, and singular value problems. It runs on single processor only. We have unoptimized reference installations in the /uufs/chpc.utah.edu/sys/pkg/lapack/std/lib tree, but highly recommend to use the Intel MKL or ACML which include full LAPACK for optimal performance.
The ScaLAPACK (or Scalable LAPACK) library includes a subset of LAPACK routines redesigned for distributed memory MIMD parallel computers. It is written in a Single-Program- Multiple-Data style using explicit message passing for interprocessor communication. It assumes matrices are laid out in a two-dimensional block cyclic decomposition.
The fundamental building blocks of the ScaLAPACK library are distributed memory versions (PBLAS) of the Level 1, 2 and 3 BLAS, and a set of Basic Linear Algebra Communication Subprograms (BLACS) for communication tasks that arise frequently in parallel linear algebra computations. In the ScaLAPACK routines, all interprocessor communication occurs within the PBLAS and the BLACS. One of the design goals of ScaLAPACK was to have the ScaLAPACK routines resemble their LAPACK equivalents as much as possible.
 
Intel MKL provides full ScaLAPACK and we recommend using it along with the Intel compilers and Intel MPI library for optimal performance. The following will link hybrid MPI and OpenMP program with ScaLAPACK from MKL, with Intel Fortran and Intel MPI, and with long integer support (64 bit integers) for large data sizes:
Fastest Fourier Transform in the West (FFTW) is a high performance Fast Fourier Transform (FFT) library. Apart from being optimized for most PC architectures it also includes OpenMP and MPI parallelism. Latest serial and threaded OpenMP builds with the three compilers that we support (GNU, Intel and PGI) are in /uufs/chpc.utah.edu/sys/pkg/fftw/[std,std_intel,std_pgi].  To link serial FFTW with e.g. Intel compiler, simply add -L/uufs/chpc.utah.edu/sys/pkg/fftw/std_intel/lib -lfftw3to the link line. To link OpenMP FFTW, add -lfftw3 to the serial link line.
Please, note that there is also FFTW version 2 which is still used in some of the codes, which is incompatible with FFTW 3. We have it installed at /uufs/chpc.utah.edu/sys/pkg/fftw/2.1.5.

### nersc
http://www.nersc.gov/users/software/programming-libraries/math-libraries/
ACML
The AMD Core Math Library (ACML) is a set of optimized and threaded math routines. It consists of the Basic Linear Algebra Subroutines (BLAS), the Linear Algebra (LAPACK) routines, FFTs, scalar, vector, and array math transcendental library routines, and random number generators. Read More »
FFTW
FFTW is a C subroutine library for computing the discrete Fourier transform (DFT) in one or more dimensions, of arbitrary input size, and of both real and complex data (as well as of even/odd data, i.e. the discrete cosine/sine transforms or DCT/DST).Read More »
GNU Science Library (GSL)
GSL is a numerical library for C and C++ programmers. It is accessed via the gsl module. Read More »
LAPACK
Linear Algebra PACKage (LAPACK) provides routines for solving systems of simultaneous linear equations, least-squares solutions of linear systems of equations, eigenvalue problems, and singular value problems. Read More »
LibSci
Cray LibSci is a collection of numerical routines optimized for best performance on Cray systems. Read More »
Math Kernel Library (MKL)
The Intel Math Kernel Library (Intel MKL) contains highly optimized, extensively threaded math routines for science, engineering, and financial applications. Core math functions include BLAS, LAPACK, ScaLAPACK, Sparse Solvers, Fast Fourier Transforms, Vector Math, and more. Read More »
NAG
NAG is a comprehensive collection of Fortran routines for the solution of numerical and statistical problems. Read More »
PETSc
PETSc is a suite of data structures and routines for the scalable (parallel) solution of scientific applications modeled by partial differential equations. It employs the MPI standard for parallelism. Read More »
PSPLINE
A library of Spline and Hermite cubic interpolation routines for 1d, 2d, and 3d datasets on rectilinear grids from PPPL. Read More »
ScaLAPACK
A library of high-performance linear algebra routines for distributed-memory message-passing computers. Read More »
SLEPc
Scalable Library for Eigenvalue Problem Computations Read More »
SPRNG
Scalable Parallel Random Number Generators Library Read More »
TPSL
The Cray Third Party Scientific Libraries (TPSL), is a collection of scientific libraries and solvers contaning MUMPS, ParMetis, SuperLU, SuperLU_DIST, Hypre, Scotch, and Sundials. Read More »
Trilinos
Trilinos is a Cray-provided package that provides abstract, object-oriented interfaces to established libraries such as Metis/ParMetis, SuperLU, Aztec, BLAS, and LAPACK. Read More »
List of Math Libraries
A list of math libraries available at NERSC. Read More »

---

http://yetanothermathprogrammingconsultant.blogspot.com.br/

http://www2.lawrence.edu/fast/GREGGJ/CMSC210/systems/systems.html

http://dl.acm.org/citation.cfm?id=368975

http://www.netlib.org/benchmark/hpl/

http://www.netlib.org/lapack/explore-html/d3/d77/example___d_g_e_l_s__colmajor_8c_source.html

https://en.wikipedia.org/wiki/List_of_numerical_libraries

http://www.mat.univie.ac.at/~neum/software.html#own

http://www.netlib.org/liblist.html

http://people.sc.fsu.edu/~jburkardt/f_src/slatec/slatec.html