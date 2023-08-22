.global _start

.section .text
_start:
#your code here
      movq head(%rip),%rax
      movq (Source),%rbx
      movl Value,%edx
      testq %rax,%rax
      je   end_HW1
      cmpl (%rbx), %edx
      je end_HW1
      movq $0 , %r10
      movq $0 , %r13
      movq head , %rcx 
      movq 4(%rcx),%r12
      movq 4(%rcx),%r11
look_Source_HW1:
        cmpq %rcx ,%rbx
        je search_HW1
        cmpq $0,4(%rcx)
        je end_HW1
        movq %rcx , %r13
        movq 4(%rcx),%rcx
        movq 4(%rcx),%r12
        jmp look_Source_HW1
      
search_HW1:
        movl (%rax),%r8d
        cmpl %r8d,%edx
        je change_HW1 
        cmpq $0,4(%rax)
        je end_HW1
        movq %rax , %r10
        movq 4(%rax),%rax
        movq 4(%rax),%r11
        jmp search_HW1
change_HW1: 
      cmp %rax,%rbx
      je end_HW1
      cmp %r11 , % rbx
      je node_before_source_HW1
      cmp % r12 , %rax
      je source_before_node_HW1
      cmp $0 , %r10 
      je update_headtosource_HW1
      cmp $0 , %r13 
      je update_headfromsource_HW1
      movq %r12,4(%rax)    # node->next = source->next
      movq %r11,4(%rbx)    # source->next = node->next
      movq %rbx ,4(%r10)   # (node->pre)->next = source
      movq %rax ,4(%r13)   # (source->pre)->next = node
      jmp end_HW1

node_before_source_HW1:
      cmp $0 , %r10 
      je update_headfromnodetosurce_HW1
      movq %rbx , 4(%r10) 
      movq %rax , 4(%rbx)
      movq %r12 , 4(%rax)  
      jmp end_HW1

update_headfromnodetosurce_HW1: 
      mov %rbx , head 
      movq %rax , 4(%rbx)
      movq %r12 , 4(%rax)
      jmp end_HW1

source_before_node_HW1:
      cmp $0 , %r13 
      je update_headfromsourcetonode_HW1
      movq %rax , 4(%r13) 
      movq %r11 , 4(%rbx)
      movq %rbx , 4(%rax)  
      jmp end_HW1
update_headfromsourcetonode_HW1:
      mov %rax , head 
      movq %rbx , 4(%rax) 
      movq %r11 , 4(%rbx)
      jmp end_HW1
update_headtosource_HW1:
     mov %rbx , head
     movq %r12,4(%rax)    # node->next = source->next
     movq %r11,4(%rbx)    # source->next = node->next
     movq %rax ,4(%r13)   # (source->pre)->next = node
     jmp end_HW1

update_headfromsource_HW1:
    mov %rax , head
    movq %r12,4(%rax)    # node->next = source->next
    movq %r11,4(%rbx)    # source->next = node->next
    movq %rbx ,4(%r10)   # (node->pre)->next = source
  
end_HW1:

