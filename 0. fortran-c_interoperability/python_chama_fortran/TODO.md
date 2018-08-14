numpy => ok1
functions => ok2
string
  intrinsic char_p to character or manual?
  
> test if sending a arrray or a pointer, the fortran can use size and get the length right
  >* of course not because c does not save lengths

emulating allocatables
  >* In Fortran 2003, the C function can malloc storage for the array, and then return that to the Fortran side as a C_PTR from the ISO_C_BINDING intrinsic module. The storage pointed to by the C_PTR can then be accessed using a Fortran POINTER and the C_F_POINTER procedure from the ISO_C_BINDING module.
  To free the storage for the array, the Fortran side would again call into a C procedure, passing the C_PTR, which the C function then uses in a call to free.


