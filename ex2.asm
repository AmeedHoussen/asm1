.global _start

.section .text
_start:
#your code here
 movq $source, %rax
    movq $destination, %rbx
    movl num , %ecx
    cmpl $0, %ecx
    je end_HW1
    jl neg_HW1
    movq $0, %r8
    cmpq %rbx , %rax 
    je end_HW1
    jb copy_backward_HW1

copy_loop_HW1:
    movb (%rax,%r8), %dl #dl = *(source + i)
    leaq (%rbx,%r8), %rsi #rsi = dest + i
    inc %r8               # i++
    movb %dl, (%rsi)      # rsi= dest + i = *(source + i)
    cmpl %r8d, %ecx      
    jne copy_loop_HW1
    jmp end_HW1

copy_backward_HW1:
   dec %rcx                   # num --
   movb (%rax , %rcx) , %dl   #dl = *(source + num)
   leaq (%rbx ,%rcx) , %r8    #r8 = dest + num
   movb %dl , (%r8)           # r8 = dest + num = *(source + num)
   cmpl $0, %ecx
   jne copy_backward_HW1
   jmp end_HW1

neg_HW1:
    movl %ecx , (%rbx)

end_HW1:
