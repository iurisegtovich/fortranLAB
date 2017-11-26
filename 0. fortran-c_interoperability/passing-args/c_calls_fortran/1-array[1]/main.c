#include <stdio.h>
#include <stdlib.h>

void ffunc_a();
void ffunc_b();

void main(){

extern int a;
extern int b[3];
printf("\n%s:%d:&a:%p\n",__FILE__,__LINE__,&a);
printf("\n%s:%d:a:%d\n",__FILE__,__LINE__,a);
a++;
printf("\n%s:%d:&a:%p\n",__FILE__,__LINE__,&a);
printf("\n%s:%d:a:%d\n",__FILE__,__LINE__,a);
ffunc_a();
printf("\n%s:%d:&a:%p\n",__FILE__,__LINE__,&a);
printf("\n%s:%d:a:%d\n",__FILE__,__LINE__,a);

printf("\n%s:%d:&b:%p\n",__FILE__,__LINE__,b);
printf("\n%s:%d:b:%d\n",__FILE__,__LINE__,b[0]);
printf("\n%s:%d:b:%d\n",__FILE__,__LINE__,b[1]);
printf("\n%s:%d:b:%d\n",__FILE__,__LINE__,b[2]);
b[0]+=3;
b[1]+=3;
b[2]+=3;
printf("\n%s:%d:&b:%p\n",__FILE__,__LINE__,b);
printf("\n%s:%d:b:%d\n",__FILE__,__LINE__,b[0]);
printf("\n%s:%d:b:%d\n",__FILE__,__LINE__,b[1]);
printf("\n%s:%d:b:%d\n",__FILE__,__LINE__,b[2]);
ffunc_b();
printf("\n%s:%d:&b:%p\n",__FILE__,__LINE__,b);
printf("\n%s:%d:b:%d\n",__FILE__,__LINE__,b[0]);
printf("\n%s:%d:b:%d\n",__FILE__,__LINE__,b[1]);
printf("\n%s:%d:b:%d\n",__FILE__,__LINE__,b[2]);
}
