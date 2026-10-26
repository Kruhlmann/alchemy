
global _start

segment .text

%line 1+0 /usr/share/alchemy/lib/std/bool.alc
%line 1+0 /usr/share/alchemy/lib/std/bool.alc
usr_true:
%line 1+0 /usr/share/alchemy/lib/std/bool.alc
mov rax, 1
push rax
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
mov rax, 0
push rax
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
mov rax, 0
push rax
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
mov rax, 0
push rax
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
mov rax, 1
push rax
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
mov rax, 2
push rax
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
mov rax, 1
push rax
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
usr_printx:
%line 26+0 /usr/share/alchemy/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 27+0 /usr/share/alchemy/lib/std/io.alc
push lit_1803
%line 27+0 /usr/share/alchemy/lib/std/io.alc
call usr_print
%line 28+0 /usr/share/alchemy/lib/std/io.alc
mov rax, 0
push rax
%line 29+0 /usr/share/alchemy/lib/std/io.alc
mov rax, 1
push rax
%line 29+0 /usr/share/alchemy/lib/std/io.alc
addr_1807: ; while
%line 29+0 /usr/share/alchemy/lib/std/io.alc
pop rax
test rax, rax
jz addr_1824; if
%line 30+0 /usr/share/alchemy/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 31+0 /usr/share/alchemy/lib/std/io.alc
pop rax
push rax
push rax
%line 31+0 /usr/share/alchemy/lib/std/io.alc
mov rax, 15
push rax
%line 31+0 /usr/share/alchemy/lib/std/io.alc
pop rbx
pop rax
and rbx, rax
push rbx
%line 31+0 /usr/share/alchemy/lib/std/io.alc
push lit_1813
%line 31+0 /usr/share/alchemy/lib/std/io.alc
pop rbx
pop rax
add rax, rbx
push rax
%line 32+0 /usr/share/alchemy/lib/std/io.alc
pop rax
pop rbx
pop rcx
push rax
push rbx
push rcx
%line 32+0 /usr/share/alchemy/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 33+0 /usr/share/alchemy/lib/std/io.alc
mov rax, 4
push rax
%line 33+0 /usr/share/alchemy/lib/std/io.alc
pop rcx
pop rbx
shr rbx, cl
push rbx
%line 34+0 /usr/share/alchemy/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 34+0 /usr/share/alchemy/lib/std/io.alc
mov rax, 1
push rax
%line 34+0 /usr/share/alchemy/lib/std/io.alc
pop rbx
pop rax
add rax, rbx
push rax
%line 35+0 /usr/share/alchemy/lib/std/io.alc
pop rbx
pop rax
push rax
push rbx
push rax
push rbx
%line 35+0 /usr/share/alchemy/lib/std/io.alc
pop rax
%line 36+0 /usr/share/alchemy/lib/std/io.alc
jmp addr_1807
addr_1824: ; else
%line 38+0 /usr/share/alchemy/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 38+0 /usr/share/alchemy/lib/std/io.alc
pop rax
%line 40+0 /usr/share/alchemy/lib/std/io.alc
addr_1827: ; while
%line 40+0 /usr/share/alchemy/lib/std/io.alc
pop rax
push rax
push rax
%line 40+0 /usr/share/alchemy/lib/std/io.alc
pop rax
test rax, rax
jz addr_1838; if
%line 41+0 /usr/share/alchemy/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 42+0 /usr/share/alchemy/lib/std/io.alc
mov rax, 1
push rax
%line 42+0 /usr/share/alchemy/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 42+0 /usr/share/alchemy/lib/std/io.alc
call usr_FD_STDOUT
%line 42+0 /usr/share/alchemy/lib/std/io.alc
call usr_SYS_WRITE
%line 42+0 /usr/share/alchemy/lib/std/io.alc
pop rax
pop rdi
pop rsi
pop rdx
syscall
%line 43+0 /usr/share/alchemy/lib/std/io.alc
mov rax, 1
push rax
%line 43+0 /usr/share/alchemy/lib/std/io.alc
pop rbx
pop rax
sub rax, rbx
push rax
%line 44+0 /usr/share/alchemy/lib/std/io.alc
jmp addr_1827
addr_1838: ; else
%line 45+0 /usr/share/alchemy/lib/std/io.alc
pop rax
%line 46+0 /usr/share/alchemy/lib/std/io.alc
ret
%line 48+0 /usr/share/alchemy/lib/std/io.alc
%line 48+0 /usr/share/alchemy/lib/std/io.alc
usr_printxln:
%line 49+0 /usr/share/alchemy/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 49+0 /usr/share/alchemy/lib/std/io.alc
call usr_printx
%line 50+0 /usr/share/alchemy/lib/std/io.alc
push lit_1845
%line 50+0 /usr/share/alchemy/lib/std/io.alc
call usr_println
%line 51+0 /usr/share/alchemy/lib/std/io.alc
ret
%line 4+0 /home/ges/doc/src/github.com/alchemy-rs/input.alc
%line 4+0 /home/ges/doc/src/github.com/alchemy-rs/input.alc
usr_main:
%line 5+0 /home/ges/doc/src/github.com/alchemy-rs/input.alc
mov rax, 4026532131
push rax
%line 5+0 /home/ges/doc/src/github.com/alchemy-rs/input.alc
call usr_printxln
%line 6+0 /home/ges/doc/src/github.com/alchemy-rs/input.alc
mov rax, 291
push rax
%line 6+0 /home/ges/doc/src/github.com/alchemy-rs/input.alc
call usr_printxln
%line 7+0 /home/ges/doc/src/github.com/alchemy-rs/input.alc
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
lit_1803: db `0x`, 0x00
lit_1813: db `0123456789abcdef`, 0x00
lit_1845: db ``, 0x00

segment .bss
mem: resb 640000
