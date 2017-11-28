#include <stdio.h>
#include <stdlib.h>

void ffunc_a(int a);
void ffunc_aa(int *a);
void ffunc_aaa(int **a);
void ffunc_b(int b);
void ffunc_bb(int b[]);
void ffunc_bbb(int (*b)[1]);

void main(){

int *a=(int *)calloc(1,sizeof(int));
*a=1;
int b[]={2};

printf("\n%p\n",&a);
printf("\n%p\n",a);
printf("\n%d\n",*a);
printf("\n%d\n",a[0]);

ffunc_a(*a);
ffunc_aa(a);
ffunc_aaa(&a);

printf("\n%p\n",&a);
printf("\n%p\n",a);
printf("\n%d\n",*a);
printf("\n%d\n",a[0]);

printf("\nNEXT\n");

printf("\n%p\n",&b);
printf("\n%p\n",b);
printf("\n%d\n",*b);
printf("\n%d\n",b[0]);

ffunc_b(*b);
ffunc_bb(b);
ffunc_bbb(&b);

printf("\n%p\n",&b);
printf("\n%p\n",b);
printf("\n%d\n",*b);
printf("\n%d\n",b[0]);

}
