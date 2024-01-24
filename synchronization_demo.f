! Example Fortran program using OpenMP for synchronization.
! This program computes the sum of integers from 1 to N in parallel.
! Compile with: gfortran -fopenmp filename.f90

program synchronization_demo
    use omp_lib
    implicit none

    integer :: n, sum, i, id, num_threads

    ! Initialize variables
    n = 100
    sum = 0
    num_threads = 4

    ! Set the number of threads
    call omp_set_num_threads(num_threads)

    ! Parallel region starts
    !$omp parallel private(id, i) shared(sum)
    id = omp_get_thread_num()

    !$omp do
    do i = 1, n
        !$omp critical
        sum = sum + i
        !$omp end critical
    end do
    !$omp end do

    if (id == 0) then
        num_threads = omp_get_num_threads()
        print *, 'Number of threads = ', num_threads
    end if

    !$omp end parallel
    ! Parallel region ends

    print *, 'Sum of integers from 1 to', n, 'is', sum

end program synchronization_demo
