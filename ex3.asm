.global _start

.section .text
_start:
	movq $array1 , %rax
	movq $array2 , %rbx
	movq $mergedArray , %rcx

check_what_to_do_HW1:
	movl (%rax), %r8d
	movl (%rbx), %r9d
	cmpl $0, %r8d	
	je copy_the_second_array_HW1
	cmpl $0, %r9d
	je copy_the_first_array_HW1
	cmpl %r8d, %r9d
	jb check_first_array_HW1
	ja check_second_array_HW1
	addq $4 , %rax
	jmp check_what_to_do_HW1

copy_the_second_array_HW1:
	movl (%rbx), %r9d
	addq $4, %rbx
	cmpl $0, %r9d
	je end_HW1
	cmpq $mergedArray, %rcx
	je prevent_first_time2_HW1
	cmpl %r9d , -4(%rcx)
	je copy_the_second_array_HW1

prevent_first_time2_HW1:
	movl %r9d , (%rcx)
	addq $4, %rcx
	jmp copy_the_second_array_HW1

copy_the_first_array_HW1:
	movl (%rax), %r8d
	addq $4, %rax
	cmpl $0, %r8d
	je end_HW1
	cmpq $mergedArray, %rcx
	je prevent_first_time1_HW1
	cmpl %r8d , -4(%rcx)
	je copy_the_first_array_HW1

prevent_first_time1_HW1:
	movl %r8d , (%rcx)
	addq $4, %rcx
	jmp copy_the_first_array_HW1

check_first_array_HW1:
	cmpl %r8d , 4(%rax)
	jne copy_from_first_array_HW1
	addq $4, %rax
	jmp check_first_array_HW1

copy_from_first_array_HW1:
	movl %r8d , (%rcx)
	addq $4, %rax
	addq $4, %rcx
	jmp check_what_to_do_HW1

check_second_array_HW1:
	cmpl %r9d , 4(%rbx)
	jne copy_from_second_array_HW1
	addq $4, %rbx
	jmp check_second_array_HW1

copy_from_second_array_HW1:
	movl %r9d ,(%rcx)
	addq $4, %rbx
	addq $4, %rcx
	jmp check_what_to_do_HW1

end_HW1:
	movl $0, (%rcx)
