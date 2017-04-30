//http://www2.lawrence.edu/fast/GREGGJ/CMSC210/systems/systems.html

#include <stdio.h>
#include <gsl/gsl_vector.h>
#include <gsl/gsl_matrix.h>

int main(int argc, const char * argv[])
{
    // Declare pointer variables for a gsl vector and a matrix
    gsl_vector *b;
    gsl_matrix *A;
    
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
    
    // Print them
    printf("The vector:\n");
    gsl_vector_fprintf(stdout, b, "%f");
    printf("The matrix\n");
    gsl_matrix_fprintf(stdout, A, "%f");
    
    // Clean up
    gsl_vector_free(b);
    gsl_matrix_free(A);

    return 0;
}
