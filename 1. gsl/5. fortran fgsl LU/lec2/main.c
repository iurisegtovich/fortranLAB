//http://www2.lawrence.edu/fast/GREGGJ/CMSC210/systems/systems.html

#include <stdio.h>
#include <gsl/gsl_vector.h>
#include <gsl/gsl_matrix.h>
#include <gsl/gsl_linalg.h>

int main(int argc, const char * argv[])
{
    // Declare pointer variables for two gsl vectors, a matrix,
    // and a permutation list
    gsl_vector *b, *x;
    gsl_matrix *A;
    gsl_permutation *p;
    int s;
    
    // Create the vector and the matrix
    b = gsl_vector_alloc (3);
    A = gsl_matrix_alloc(3, 3);
    
    // load them with values
    gsl_vector_set(b, 0, 0.0);
    gsl_vector_set(b, 0, 4.0);
    gsl_vector_set(b, 0, -2.0);
    
    gsl_matrix_set(A,0,0,1.0);
    gsl_matrix_set(A,0,1,-2.0);
    gsl_matrix_set(A,0,2,1.0);
    
    gsl_matrix_set(A,1,0,2.0);
    gsl_matrix_set(A,1,1,3.0);
    gsl_matrix_set(A,1,2,-1.0);
    
    gsl_matrix_set(A,2,0,3.0);
    gsl_matrix_set(A,2,1,1.0);
    gsl_matrix_set(A,2,2,-2.0);
    
    // Solve the system A x = b
    // Start by creating a vector to receive the result
    // and a permutation list to pass to the LU decomposition
    x = gsl_vector_alloc(3);
    p = gsl_permutation_alloc(3);
    
    // Do the LU decomposition on A and use it to solve the system
    gsl_linalg_LU_decomp(A, p, &s);
    gsl_linalg_LU_solve(A, p, b, x);

    // Print the result
    printf("The solution:\n");
    gsl_vector_fprintf(stdout, x, "%f");
    
    // Clean up
    gsl_vector_free(b);
    gsl_vector_free(x);
    gsl_permutation_free(p);
    gsl_matrix_free(A);
    
    return 0;
}
