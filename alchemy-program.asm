
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

%line 1+0 /usr/share/alchemy/lib/std/bool.alc
%line 1+0 /usr/share/alchemy/lib/std/bool.alc
usr_true:
%line 1+0 /usr/share/alchemy/lib/std/bool.alc
push 1
%line 1+0 /usr/share/alchemy/lib/std/bool.alc
pop rax
pop rbx
push rax
push rbx
%line 1+0 /usr/share/alchemy/lib/std/bool.alc
ret
%line 2+0 /usr/share/alchemy/lib/std/bool.alc
%line 2+0 /usr/share/alchemy/lib/std/bool.alc
usr_false:
%line 2+0 /usr/share/alchemy/lib/std/bool.alc
push 0
%line 2+0 /usr/share/alchemy/lib/std/bool.alc
pop rax
pop rbx
push rax
push rbx
%line 2+0 /usr/share/alchemy/lib/std/bool.alc
ret
%line 3+0 /usr/share/alchemy/lib/std/str.alc
%line 3+0 /usr/share/alchemy/lib/std/str.alc
usr_STR_NEWLINE:
%line 3+0 /usr/share/alchemy/lib/std/str.alc
push lit_12
%line 3+0 /usr/share/alchemy/lib/std/str.alc
pop rax
pop rbx
push rax
push rbx
%line 3+0 /usr/share/alchemy/lib/std/str.alc
ret
%line 4+0 /usr/share/alchemy/lib/std/str.alc
%line 4+0 /usr/share/alchemy/lib/std/str.alc
usr_strlen:
%line 8+0 /usr/share/alchemy/lib/std/str.alc
pop rax
pop rbx
push rax
push rbx
%line 8+0 /usr/share/alchemy/lib/std/str.alc
push 0
%line 8+0 /usr/share/alchemy/lib/std/str.alc
pop rax
pop rbx
push rax
push rbx
%line 9+0 /usr/share/alchemy/lib/std/str.alc
addr_30: ; while
%line 9+0 /usr/share/alchemy/lib/std/str.alc
pop rax
push rax
push rax
%line 9+0 /usr/share/alchemy/lib/std/str.alc
pop rax
movzx ebx, byte [rax]
push rbx
%line 9+0 /usr/share/alchemy/lib/std/str.alc
push 0
%line 9+0 /usr/share/alchemy/lib/std/str.alc
mov rcx, 0
mov rdx, 1
pop rbx
pop rax
cmp rax, rbx
cmovg rcx, rdx
push rcx
%line 9+0 /usr/share/alchemy/lib/std/str.alc
pop rax
test rax, rax
jz addr_40; if
%line 10+0 /usr/share/alchemy/lib/std/str.alc
push 1
pop rbx
pop rax
add rax, rbx
push rax
%line 10+0 /usr/share/alchemy/lib/std/str.alc
pop rax
pop rbx
push rax
push rbx
%line 10+0 /usr/share/alchemy/lib/std/str.alc
push 1
pop rbx
pop rax
add rax, rbx
push rax
%line 10+0 /usr/share/alchemy/lib/std/str.alc
pop rax
pop rbx
push rax
push rbx
%line 11+0 /usr/share/alchemy/lib/std/str.alc
jmp addr_30
addr_40: ; else
%line 12+0 /usr/share/alchemy/lib/std/str.alc
pop rax
%line 12+0 /usr/share/alchemy/lib/std/str.alc
pop rax
pop rbx
push rax
push rbx
%line 13+0 /usr/share/alchemy/lib/std/str.alc
ret
%line 15+0 /usr/share/alchemy/lib/std/str.alc
%line 15+0 /usr/share/alchemy/lib/std/str.alc
usr_FD_STDOUT:
%line 1+0 /usr/share/alchemy/lib/std/sys/fd.alc
push 1
%line 1+0 /usr/share/alchemy/lib/std/sys/fd.alc
pop rax
pop rbx
push rax
push rbx
%line 1+0 /usr/share/alchemy/lib/std/sys/fd.alc
ret
%line 2+0 /usr/share/alchemy/lib/std/sys/fd.alc
%line 2+0 /usr/share/alchemy/lib/std/sys/fd.alc
usr_FD_STDERR:
%line 2+0 /usr/share/alchemy/lib/std/sys/fd.alc
push 2
%line 2+0 /usr/share/alchemy/lib/std/sys/fd.alc
pop rax
pop rbx
push rax
push rbx
%line 2+0 /usr/share/alchemy/lib/std/sys/fd.alc
ret
%line 1+0 /usr/share/alchemy/lib/std/sys/call.alc
%line 1+0 /usr/share/alchemy/lib/std/sys/call.alc
usr_SYS_WRITE:
%line 2+0 /usr/share/alchemy/lib/std/sys/call.alc
push 1
%line 2+0 /usr/share/alchemy/lib/std/sys/call.alc
pop rax
pop rbx
push rax
push rbx
%line 2+0 /usr/share/alchemy/lib/std/sys/call.alc
ret
%line 3+0 /usr/share/alchemy/lib/std/sys/call.alc
%line 3+0 /usr/share/alchemy/lib/std/sys/call.alc
usr_print:
%line 6+0 /usr/share/alchemy/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 6+0 /usr/share/alchemy/lib/std/io.alc
pop rax
push rax
push rax
%line 6+0 /usr/share/alchemy/lib/std/io.alc
call usr_strlen
%line 6+0 /usr/share/alchemy/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 6+0 /usr/share/alchemy/lib/std/io.alc
call usr_FD_STDOUT
%line 6+0 /usr/share/alchemy/lib/std/io.alc
call usr_SYS_WRITE
%line 6+0 /usr/share/alchemy/lib/std/io.alc
pop rax
pop rdi
pop rsi
pop rdx
syscall
%line 7+0 /usr/share/alchemy/lib/std/io.alc
ret
%line 9+0 /usr/share/alchemy/lib/std/io.alc
%line 9+0 /usr/share/alchemy/lib/std/io.alc
usr_printe:
%line 10+0 /usr/share/alchemy/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 10+0 /usr/share/alchemy/lib/std/io.alc
pop rax
push rax
push rax
%line 10+0 /usr/share/alchemy/lib/std/io.alc
call usr_strlen
%line 10+0 /usr/share/alchemy/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 10+0 /usr/share/alchemy/lib/std/io.alc
call usr_FD_STDERR
%line 10+0 /usr/share/alchemy/lib/std/io.alc
call usr_SYS_WRITE
%line 10+0 /usr/share/alchemy/lib/std/io.alc
pop rax
pop rdi
pop rsi
pop rdx
syscall
%line 11+0 /usr/share/alchemy/lib/std/io.alc
ret
%line 13+0 /usr/share/alchemy/lib/std/io.alc
%line 13+0 /usr/share/alchemy/lib/std/io.alc
usr_println:
%line 14+0 /usr/share/alchemy/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 14+0 /usr/share/alchemy/lib/std/io.alc
call usr_print
%line 14+0 /usr/share/alchemy/lib/std/io.alc
call usr_STR_NEWLINE
%line 14+0 /usr/share/alchemy/lib/std/io.alc
call usr_print
%line 15+0 /usr/share/alchemy/lib/std/io.alc
ret
%line 17+0 /usr/share/alchemy/lib/std/io.alc
%line 17+0 /usr/share/alchemy/lib/std/io.alc
usr_main:
%line 41+0 /home/ges/doc/src/github.com/alchemy-rs/input.alc
push lit_1917
%line 41+0 /home/ges/doc/src/github.com/alchemy-rs/input.alc
call usr_println
%line 42+0 /home/ges/doc/src/github.com/alchemy-rs/input.alc
ret

_start:
call usr_main
mov rax, 60
mov rdi, 0
syscall

segment .rodata
hex_digits: db "0123456789abcdef"
lit_12: db `\n`, 0x00
lit_17: db `0123456789ABCDEF`, 0x00
lit_22: db `0123456789abcdef`, 0x00
lit_1917: db `Hello, World!`, 0x00

segment .bss
mem: resb 640000
