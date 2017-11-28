#include <stdio.h>
#include <stdlib.h>

void ffunc_a(int a);
void ffunc_b(int *b);

void main(){

int a=1;
int b=2;

printf("\n%p\n",&a);
printf("\n%d\n",a);

ffunc_a(a);

printf("\n%p\n",&a);
printf("\n%d\n",a);

printf("\nNEXT\n");

printf("\n%d\n",b);
printf("\n%p\n",&b);

ffunc_b(&b);

printf("\n%d\n",b);
printf("\n%p\n",&b);

}
