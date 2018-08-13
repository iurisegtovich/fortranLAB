import numpy as np
from time import time

m1=np.zeros([999,999])
m2=np.zeros([999,999])
m3=np.zeros([999,999])

for i in range(1, 1000):
	for j in range( 999):
		m1[i-1,j-1] = 10*i+j
		m2[i-1,j-1] = 9*j+2*i

t1 = time()

m3 = m1 @ m2

t2 = time()

print( " ",t2-t1 )
