#gfortran, linal101matmul
gfortran linalg101matmul.f90
./a.out 

#automatically optmized
gfortran -O3 -ffast-math -march=native linalg101matmul.f90 
./a.out 

# gfortran, intrinsic matmul
gfortran -O3 -ffast-math -march=native testmatmul.f90 
./a.out 

#python, anaconda, mkl
python testmatmul.py 

# gfortran, anaconda, mkl
gfortran -fexternal-blas testmatmul.f90 -L"/home/segtovichisv/anaconda3/pkgs/mkl-2017.0.1-0/lib" -lmkl_rt
LD_LIBRARY_PATH=/home/segtovichisv/anaconda3/pkgs/mkl-2017.0.1-0/lib/
export LD_LIBRARY_PATH
./a.out 

#  0.70799999999999996     
#  0.06545782089233398
#  0.15600000000000000 
  
#  0.66799999999999993     
#  0.061945199966430664
#  0.12399999999999999 

#  0.66799999999999993     
#  0.06154322624206543
#  0.13200000000000001     

#  0.66799999999999993     
#  0.11251592636108398
#  0.14000000000000001

#---20171129
#try1
#   2.7279999999999998     
#  0.54399999999999993     
#  0.48399999999999999     
#  0.03460812568664551
#   9.1999999999999998E-002
#try2
#   2.7159999999999997     
#  0.55199999999999994     
#  0.49199999999999999     
#  0.030101776123046875
#  0.14799999999999999
#try3
#   2.8159999999999998     
#  0.52400000000000002     
#  0.46799999999999997     
#  0.060745954513549805
#  0.18799999999999997
#try4
#   2.7360000000000002     
#  0.57599999999999996     
#  0.48399999999999999     
#  0.026051044464111328
#  0.10799999999999998  
