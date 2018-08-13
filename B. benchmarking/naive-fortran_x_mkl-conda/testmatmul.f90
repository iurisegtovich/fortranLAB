program testmatmul

implicit none
 integer :: i, j
 real(8), allocatable :: m1(:,:), m2(:,:), m3(:,:)
 real(8) :: t1,t2
 real(8) :: ans
 allocate( m1(999,999) )
 allocate( m2(999,999) )
 allocate( m3(999,999) )
 
 do i = 1, 999
  do j = 1, 999
    m1(i,j) = 10*i+j
    m2(i,j) = 9*j+2*i
  enddo
enddo

call cpu_time(t1)

  m3 = matmul(m1,m2)

call cpu_time(t2)

print*, t2-t1

write(46871231,*) m3

end program
