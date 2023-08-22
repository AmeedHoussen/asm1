.global _start

.section .text
_start:
#your code here
	movq (root) , %rax
	movq $new_node , %rbx
	movq (%rbx) , %rcx
	cmpq $0 , %rax
	je null_root_HW1
	movq (%rax) , %rdx

search_HW1: 
      cmpq $0 , %rax
	je null_root_HW1
      movq (%rax) , %rdx
	cmpq %rdx , %rcx
	je end_HW1
	jb left_HW1
	ja right_HW1

null_root_HW1:
	movq %rbx , (root)
	jmp end_HW1

left_HW1:
	movq 8(%rax), %r9
	cmpq $0 , %r9
	je add_left_HW1
	movq %r9 , %rax
      jmp search_HW1 

add_left_HW1:
	movq %rbx , 8(%rax)
	jmp end_HW1 

right_HW1:
	movq 16(%rax), %r9
	cmpq $0 , %r9
	je add_right_HW1
	movq %r9 , %rax
       jmp search_HW1 

add_right_HW1:
	movq %rbx , 16(%rax)

end_HW1:
