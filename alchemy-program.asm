
global _start

segment .text

put:
pop r11
pop rax
push r11
sub rsp, 24
mov byte [rsp + 16], 10
mov ecx, 16
lea r8, [rel hex_digits]

.convert:
mov rdx, rax
and edx, 0xf
mov dl, [r8 + rdx]
mov [rsp + rcx - 1], dl
shr rax, 4
dec ecx
jnz .convert
mov eax, 1 
mov edi, 1
mov rsi, rsp
mov edx, 17
syscall
add rsp, 24
ret

usr_bar:
pop rax
pop rbx
push rax
push rbx
push 8
addr_113: ; while
pop rbx
pop rax
push rax
push rbx
push rax
push rbx
pop rcx
pop rbx
shr rbx, cl
push rbx
push 15
push 0
mov rcx, 0
mov rdx, 1
pop rax
pop rbx
cmp rax, rbx
cmove rcx, rdx
push rcx
pop rax
test rax, rax
jz addr_122; if
push 4
pop rbx
pop rax
sub rax, rbx
push rax
jmp addr_113
addr_122: ; else
ret
usr_main:
push 2748
call usr_bar
ret

_start:
call usr_main
mov rax, 60
mov rdi, 0
syscall

segment .rodata
hex_digits: db "0123456789abcdef"


segment .bss
mem: resb 640000
