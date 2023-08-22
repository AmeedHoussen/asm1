.global _start

.section .text
_start:
#your code here
		movq num, %rax

loop_HW1:
		sal $1, %rax
		jb counter_HW1
		cmpq $0, %rax
		jne loop_HW1
		jmp end_HW1

counter_HW1:
		incq Bool
		jmp loop_HW1
		
end_HW1:
	