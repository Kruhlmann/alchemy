global _start
segment .text
print:
mov rax, 1
syscall
ret
dump:
mov r9, -3689348814741910323
sub rsp, 40
mov BYTE [rsp+31], 10
lea rcx, [rsp+30]
.dump_loop:
mov rax, rdi
lea r8, [rsp+32]
mul r9
mov rax, rdi
sub r8, rcx
shr rdx, 3
lea rsi, [rdx+rdx*4]
add rsi, rsi
sub rax, rsi
add eax, 48
mov BYTE [rcx], al
mov rax, rdi
mov rdi, rdx
mov rdx, rcx
sub rcx, 1
cmp rax, 9
ja  .dump_loop
lea rax, [rsp+32]
mov edi, 1
sub rdx, rax
lea rsi, [rsp+32+rdx]
mov rdx, r8
call print
add  rsp, 40
ret
_start:
push 14
push 15
pop rbx
pop rax
add rax, rbx
push rax
pop rdi
call dump
mov rax, 60
mov rdi, 0
syscall
segment .data
segment .bss
mem: resb 640000