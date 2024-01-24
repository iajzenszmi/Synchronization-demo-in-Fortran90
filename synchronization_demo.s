	.file	"synchronization_demo.f90"
	.text
	.section	.rodata
.LC0:
	.string	"synchronization_demo.f90"
.LC1:
	.ascii	"Sum of integers from 1 to"
.LC2:
	.ascii	"is"
	.text
	.type	MAIN__, @function
MAIN__:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1104, %rsp
	movl	$100, -564(%rbp)
	movl	$0, -572(%rbp)
	movl	$4, -568(%rbp)
	leaq	-568(%rbp), %rax
	movq	%rax, %rdi
	call	omp_set_num_threads_@PLT
	leaq	-564(%rbp), %rax
	movq	%rax, -560(%rbp)
	leaq	-568(%rbp), %rax
	movq	%rax, -552(%rbp)
	leaq	-572(%rbp), %rax
	movq	%rax, -544(%rbp)
	leaq	-560(%rbp), %rax
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	leaq	MAIN__._omp_fn.0(%rip), %rax
	movq	%rax, %rdi
	call	GOMP_parallel@PLT
	leaq	.LC0(%rip), %rax
	movq	%rax, -1096(%rbp)
	movl	$39, -1088(%rbp)
	movl	$128, -1104(%rbp)
	movl	$6, -1100(%rbp)
	leaq	-1104(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write@PLT
	leaq	-1104(%rbp), %rax
	movl	$25, %edx
	leaq	.LC1(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_gfortran_transfer_character_write@PLT
	leaq	-564(%rbp), %rcx
	leaq	-1104(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_gfortran_transfer_integer_write@PLT
	leaq	-1104(%rbp), %rax
	movl	$2, %edx
	leaq	.LC2(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_gfortran_transfer_character_write@PLT
	leaq	-572(%rbp), %rcx
	leaq	-1104(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_gfortran_transfer_integer_write@PLT
	leaq	-1104(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write_done@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	MAIN__, .-MAIN__
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movl	-4(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	_gfortran_set_args@PLT
	leaq	options.2.0(%rip), %rax
	movq	%rax, %rsi
	movl	$7, %edi
	call	_gfortran_set_options@PLT
	call	MAIN__
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.section	.rodata
.LC3:
	.ascii	"Number of threads = "
	.text
	.type	MAIN__._omp_fn.0, @function
MAIN__._omp_fn.0:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$560, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -568(%rbp)
	call	omp_get_thread_num_@PLT
	movl	%eax, -24(%rbp)
	movq	-568(%rbp), %rax
	movq	(%rax), %rax
	movl	(%rax), %r12d
	call	omp_get_num_threads@PLT
	movl	%eax, %ebx
	call	omp_get_thread_num@PLT
	movl	%eax, %edi
	leal	1(%r12), %eax
	leal	-1(%rax), %esi
	movl	%esi, %eax
	cltd
	idivl	%ebx
	movl	%eax, %ecx
	movl	%esi, %eax
	cltd
	idivl	%ebx
	movl	%edx, %eax
	cmpl	%eax, %edi
	jl	.L5
.L10:
	imull	%ecx, %edi
	movl	%edi, %edx
	addl	%edx, %eax
	leal	(%rax,%rcx), %edx
	cmpl	%edx, %eax
	jge	.L6
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	leal	1(%rdx), %ebx
.L7:
	call	GOMP_critical_start@PLT
	movq	-568(%rbp), %rax
	movq	16(%rax), %rax
	movl	(%rax), %edx
	movl	-20(%rbp), %eax
	addl	%eax, %edx
	movq	-568(%rbp), %rax
	movq	16(%rax), %rax
	movl	%edx, (%rax)
	call	GOMP_critical_end@PLT
	addl	$1, -20(%rbp)
	cmpl	%ebx, -20(%rbp)
	jl	.L7
.L6:
	call	GOMP_barrier@PLT
	cmpl	$0, -24(%rbp)
	jne	.L11
	call	omp_get_num_threads_@PLT
	movq	-568(%rbp), %rdx
	movq	8(%rdx), %rdx
	movl	%eax, (%rdx)
	leaq	.LC0(%rip), %rax
	movq	%rax, -552(%rbp)
	movl	$33, -544(%rbp)
	movl	$128, -560(%rbp)
	movl	$6, -556(%rbp)
	leaq	-560(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write@PLT
	leaq	-560(%rbp), %rax
	movl	$20, %edx
	leaq	.LC3(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_gfortran_transfer_character_write@PLT
	movq	-568(%rbp), %rax
	movq	8(%rax), %rcx
	leaq	-560(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_gfortran_transfer_integer_write@PLT
	leaq	-560(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write_done@PLT
	jmp	.L11
.L5:
	movl	$0, %eax
	addl	$1, %ecx
	jmp	.L10
.L11:
	nop
	addq	$560, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	MAIN__._omp_fn.0, .-MAIN__._omp_fn.0
	.section	.rodata
	.align 16
	.type	options.2.0, @object
	.size	options.2.0, 28
options.2.0:
	.long	2116
	.long	4095
	.long	0
	.long	1
	.long	1
	.long	0
	.long	31
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
