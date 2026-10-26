
global _start

segment .text

%line 1+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
%line 1+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
usr_SYS_READ:
%line 1+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
mov rax, 0
push rax
%line 1+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
pop rax
pop rbx
push rax
push rbx
%line 1+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
ret
%line 2+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
%line 2+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
usr_SYS_WRITE:
%line 2+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
mov rax, 1
push rax
%line 2+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
pop rax
pop rbx
push rax
push rbx
%line 2+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
ret
%line 3+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
%line 3+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
usr_SYS_CLOSE:
%line 4+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
mov rax, 3
push rax
%line 4+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
pop rax
pop rbx
push rax
push rbx
%line 4+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
ret
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
usr_SYS_MMAP:
%line 10+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
mov rax, 9
push rax
%line 10+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
pop rax
pop rbx
push rax
push rbx
%line 10+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
ret
%line 11+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
%line 11+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
usr_SYS_MUNMAP:
%line 12+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
mov rax, 11
push rax
%line 12+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
pop rax
pop rbx
push rax
push rbx
%line 12+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
ret
%line 13+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
%line 13+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
usr_SYS_SOCKET:
%line 42+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
mov rax, 41
push rax
%line 42+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
pop rax
pop rbx
push rax
push rbx
%line 42+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
ret
%line 43+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
%line 43+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
usr_SYS_CONNECT:
%line 43+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
mov rax, 42
push rax
%line 43+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
pop rax
pop rbx
push rax
push rbx
%line 43+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
ret
%line 44+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
%line 44+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
usr_SYS_SENDTO:
%line 45+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
mov rax, 44
push rax
%line 45+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
pop rax
pop rbx
push rax
push rbx
%line 45+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
ret
%line 46+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
%line 46+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
usr_SYS_EXIT:
%line 61+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
mov rax, 60
push rax
%line 61+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
pop rax
pop rbx
push rax
push rbx
%line 61+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
ret
%line 62+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
%line 62+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/call.alc
usr_mem_alloc:
%line 4+0 /home/ges/doc/src/github.com/alchemyc/lib/std/mem.alc
pop rax
pop rbx
push rax
push rbx
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/mem.alc
mov rax, 0
push rax
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/mem.alc
pop rax
pop rbx
push rax
push rbx
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/mem.alc
mov rax, -1
push rax
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/mem.alc
pop rax
pop rbx
push rax
push rbx
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/mem.alc
mov rax, 34
push rax
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/mem.alc
pop rax
pop rbx
push rax
push rbx
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/mem.alc
mov rax, 3
push rax
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/mem.alc
pop rax
pop rbx
push rax
push rbx
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/mem.alc
mov rax, 0
push rax
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/mem.alc
call usr_SYS_MMAP
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/mem.alc
pop rax
pop rdi
pop rsi
pop rdx
pop r10
pop r8
pop r9
syscall
push rax
%line 6+0 /home/ges/doc/src/github.com/alchemyc/lib/std/mem.alc
pop rax
pop rbx
push rax
push rbx
%line 7+0 /home/ges/doc/src/github.com/alchemyc/lib/std/mem.alc
ret
%line 9+0 /home/ges/doc/src/github.com/alchemyc/lib/std/mem.alc
%line 9+0 /home/ges/doc/src/github.com/alchemyc/lib/std/mem.alc
usr_mem_free:
%line 10+0 /home/ges/doc/src/github.com/alchemyc/lib/std/mem.alc
pop rax
pop rbx
pop rcx
push rax
push rbx
push rcx
%line 10+0 /home/ges/doc/src/github.com/alchemyc/lib/std/mem.alc
call usr_SYS_MUNMAP
%line 10+0 /home/ges/doc/src/github.com/alchemyc/lib/std/mem.alc
pop rax
pop rdi
pop rsi
syscall
push rax
%line 10+0 /home/ges/doc/src/github.com/alchemyc/lib/std/mem.alc
pop rax
pop rbx
push rax
push rbx
%line 11+0 /home/ges/doc/src/github.com/alchemyc/lib/std/mem.alc
ret
%line 3+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
%line 3+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
usr_socket_tcp:
%line 4+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rax, 0
push rax
%line 4+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rax, 1
push rax
%line 4+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rax, 2
push rax
%line 4+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
call usr_SYS_SOCKET
%line 4+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rdi
pop rsi
pop rdx
syscall
push rax
%line 4+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
push rax
push rbx
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
ret
%line 7+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
%line 7+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
usr_socket_store_be16:
%line 8+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
pop rcx
push rax
push rbx
push rcx
%line 9+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rbx
pop rax
push rax
push rbx
push rax
push rbx
%line 9+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
push rax
push rbx
%line 9+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rax, 8
push rax
%line 9+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rcx
pop rbx
shr rbx, cl
push rbx
%line 9+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rbx
pop rax
mov byte [rax], bl
%line 10+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
push 1
pop rbx
pop rax
add rax, rbx
push rax
%line 10+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
push rax
push rbx
%line 10+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rax, 255
push rax
%line 10+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rbx
pop rax
and rbx, rax
push rbx
%line 10+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rbx
pop rax
mov byte [rax], bl
%line 11+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
ret
%line 13+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
%line 13+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
usr_socket_store_be32:
%line 14+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
pop rcx
push rax
push rbx
push rcx
%line 14+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
push rax
push rbx
%line 15+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rbx
pop rax
push rax
push rbx
push rax
push rbx
%line 15+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rax, 16
push rax
%line 15+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rcx
pop rbx
shr rbx, cl
push rbx
%line 15+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
call usr_socket_store_be16
%line 16+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
push rax
push rbx
%line 16+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rax, 2
push rax
%line 16+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rbx
pop rax
add rax, rbx
push rax
%line 16+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
push rax
push rbx
%line 16+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
call usr_socket_store_be16
%line 17+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
ret
%line 19+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
%line 19+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
usr_socket_connect_ipv4:
%line 20+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
pop rcx
pop rdx
push rax
push rbx
push rcx
push rdx
%line 20+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
pop rcx
push rax
push rbx
push rcx
%line 21+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
push rax
push rax
%line 21+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rax, 0
push rax
%line 21+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rcx, 0
mov rdx, 1
pop rbx
pop rax
cmp rax, rbx
cmovl rcx, rdx
push rcx
%line 21+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
test rax, rax
jz addr_1644; if
%line 21+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
%line 21+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
%line 21+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
%line 21+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rax, -22
push rax
%line 21+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
push rax
push rbx
%line 21+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
ret
%line 21+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
addr_1644: ; endif
%line 22+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
push rax
push rax
%line 22+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rax, 65535
push rax
%line 22+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rcx, 0
mov rdx, 1
pop rbx
pop rax
cmp rax, rbx
cmovg rcx, rdx
push rcx
%line 22+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
test rax, rax
jz addr_1655; if
%line 22+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
%line 22+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
%line 22+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
%line 22+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rax, -22
push rax
%line 22+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
push rax
push rbx
%line 22+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
ret
%line 22+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
addr_1655: ; endif
%line 23+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
push rax
push rbx
%line 23+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
push rax
push rax
%line 23+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rax, 32
push rax
%line 23+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rcx
pop rbx
shr rbx, cl
push rbx
%line 23+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rax, 0
push rax
%line 23+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rcx, 0
mov rdx, 1
pop rax
pop rbx
cmp rax, rbx
cmovne rcx, rdx
push rcx
%line 23+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
test rax, rax
jz addr_1669; if
%line 23+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
%line 23+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
%line 23+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
%line 23+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rax, -22
push rax
%line 23+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
push rax
push rbx
%line 23+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
ret
%line 23+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
addr_1669: ; endif
%line 24+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
push rax
push rbx
%line 26+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rax, 16
push rax
%line 26+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
call usr_mem_alloc
%line 27+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
push rax
push rax
%line 27+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rax, 0
push rax
%line 27+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rcx, 0
mov rdx, 1
pop rbx
pop rax
cmp rax, rbx
cmovl rcx, rdx
push rcx
%line 27+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
test rax, rax
jz addr_1683; if
%line 27+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
pop rcx
pop rdx
push rax
push rbx
push rcx
push rdx
%line 27+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
%line 27+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
%line 27+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
%line 27+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
push rax
push rbx
%line 27+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
ret
%line 27+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
addr_1683: ; endif
%line 28+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
push rax
push rax
%line 28+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rax, 2
push rax
%line 28+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rbx
pop rax
mov byte [rax], bl
%line 29+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
push rax
push rbx
%line 29+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rbx
pop rax
push rax
push rbx
push rax
push rbx
%line 29+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
push rax
push rbx
%line 29+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rax, 2
push rax
%line 29+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rbx
pop rax
add rax, rbx
push rax
%line 29+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
push rax
push rbx
%line 29+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
call usr_socket_store_be16
%line 29+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
%line 30+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rbx
pop rax
push rax
push rbx
push rax
push rbx
%line 30+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rax, 4
push rax
%line 30+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rbx
pop rax
add rax, rbx
push rax
%line 30+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
push rax
push rbx
%line 30+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
call usr_socket_store_be32
%line 31+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
push rax
push rbx
%line 31+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
%line 33+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rbx
pop rax
push rax
push rbx
push rax
push rbx
%line 33+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rax, 16
push rax
%line 33+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
pop rcx
push rax
push rbx
push rcx
%line 33+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
call usr_SYS_CONNECT
%line 33+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rdi
pop rsi
pop rdx
syscall
push rax
%line 34+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
pop rcx
push rax
push rbx
push rcx
%line 34+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
%line 35+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rax, 16
push rax
%line 35+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
call usr_mem_free
%line 35+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
%line 36+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
push rax
push rbx
%line 37+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
ret
%line 39+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
%line 39+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
usr_socket_read:
%line 40+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
pop rcx
pop rdx
push rax
push rbx
push rcx
push rdx
%line 40+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
call usr_SYS_READ
%line 40+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rdi
pop rsi
pop rdx
syscall
push rax
%line 40+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
push rax
push rbx
%line 41+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
ret
%line 43+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
%line 43+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
usr_socket_write:
%line 44+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
pop rcx
pop rdx
push rax
push rbx
push rcx
push rdx
%line 44+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
pop rcx
push rax
push rbx
push rcx
%line 45+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rax, 16384
push rax
%line 45+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rax, 0
push rax
%line 45+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
mov rax, 0
push rax
%line 45+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
pop rcx
pop rdx
pop r8
pop r9
push rax
push rbx
push rcx
push rdx
push r8
push r9
%line 45+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
call usr_SYS_SENDTO
%line 45+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rdi
pop rsi
pop rdx
pop r10
pop r8
pop r9
syscall
push rax
%line 45+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
push rax
push rbx
%line 46+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
ret
%line 48+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
%line 48+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
usr_socket_close:
%line 49+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
push rax
push rbx
%line 49+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
call usr_SYS_CLOSE
%line 49+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rdi
syscall
push rax
%line 49+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
pop rax
pop rbx
push rax
push rbx
%line 50+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/socket.alc
ret
%line 1+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
%line 1+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
usr_ipv4_parse_octet:
%line 2+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 3+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
push rax
push rax
%line 3+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
movzx ebx, byte [rax]
push rbx
%line 3+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, 48
push rax
%line 3+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rcx, 0
mov rdx, 1
pop rbx
pop rax
cmp rax, rbx
cmovl rcx, rdx
push rcx
%line 3+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
test rax, rax
jz addr_1754; if
%line 3+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
%line 3+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, 0
push rax
%line 3+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, -22
push rax
%line 3+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 3+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
pop rcx
push rax
push rbx
push rcx
%line 3+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
ret
%line 3+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
addr_1754: ; endif
%line 4+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
push rax
push rax
%line 4+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
movzx ebx, byte [rax]
push rbx
%line 4+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, 57
push rax
%line 4+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rcx, 0
mov rdx, 1
pop rbx
pop rax
cmp rax, rbx
cmovg rcx, rdx
push rcx
%line 4+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
test rax, rax
jz addr_1766; if
%line 4+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
%line 4+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, 0
push rax
%line 4+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, -22
push rax
%line 4+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 4+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
pop rcx
push rax
push rbx
push rcx
%line 4+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
ret
%line 4+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
addr_1766: ; endif
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
push rax
push rax
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
movzx ebx, byte [rax]
push rbx
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, 48
push rax
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rcx, 0
mov rdx, 1
pop rax
pop rbx
cmp rax, rbx
cmove rcx, rdx
push rcx
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
test rax, rax
jz addr_1777; if
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
push 1
pop rbx
pop rax
add rax, rbx
push rax
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, 0
push rax
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
pop rcx
push rax
push rbx
push rcx
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
ret
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
addr_1777: ; endif
%line 7+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, 0
push rax
%line 8+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
addr_1779: ; while
%line 9+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rbx
pop rax
push rax
push rbx
push rax
push rbx
%line 9+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
%line 9+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
movzx ebx, byte [rax]
push rbx
%line 9+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
push rax
push rax
%line 9+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, 48
push rax
%line 9+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rcx, 0
mov rdx, 1
pop rbx
pop rax
cmp rax, rbx
cmovge rcx, rdx
push rcx
%line 9+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 9+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, 57
push rax
%line 9+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rcx, 0
mov rdx, 1
pop rbx
pop rax
cmp rax, rbx
cmovle rcx, rdx
push rcx
%line 9+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rbx
pop rax
and rbx, rax
push rbx
%line 10+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
test rax, rax
jz addr_1820; if
%line 11+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rbx
pop rax
push rax
push rbx
push rax
push rbx
%line 11+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
%line 11+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
movzx ebx, byte [rax]
push rbx
%line 11+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, 48
push rax
%line 11+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rbx
pop rax
sub rax, rbx
push rax
%line 12+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 12+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
push rax
push rax
%line 12+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, 3
push rax
%line 12+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rcx
pop rbx
shl rbx, cl
push rbx
%line 12+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 12+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, 1
push rax
%line 12+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rcx
pop rbx
shl rbx, cl
push rbx
%line 12+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rbx
pop rax
add rax, rbx
push rax
%line 12+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rbx
pop rax
add rax, rbx
push rax
%line 13+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
push rax
push rax
%line 13+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, 255
push rax
%line 13+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rcx, 0
mov rdx, 1
pop rbx
pop rax
cmp rax, rbx
cmovg rcx, rdx
push rcx
%line 13+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
test rax, rax
jz addr_1816; if
%line 13+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
%line 13+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
%line 13+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, 0
push rax
%line 13+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, -22
push rax
%line 13+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 13+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
pop rcx
push rax
push rbx
push rcx
%line 13+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
ret
%line 13+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
addr_1816: ; endif
%line 14+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 14+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
push 1
pop rbx
pop rax
add rax, rbx
push rax
%line 14+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 15+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
jmp addr_1779
addr_1820: ; else
%line 16+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 16+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
pop rcx
push rax
push rbx
push rcx
%line 17+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
ret
%line 19+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
%line 19+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
usr_ipv4_parse:
%line 20+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 20+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
call usr_ipv4_parse_octet
%line 21+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
push rax
push rax
%line 21+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, 0
push rax
%line 21+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rcx, 0
mov rdx, 1
pop rbx
pop rax
cmp rax, rbx
cmovl rcx, rdx
push rcx
%line 21+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
test rax, rax
jz addr_1836; if
%line 21+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 21+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
%line 21+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 21+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
ret
%line 21+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
addr_1836: ; endif
%line 22+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 24+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
push rax
push rax
%line 24+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
movzx ebx, byte [rax]
push rbx
%line 24+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, 46
push rax
%line 24+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rcx, 0
mov rdx, 1
pop rax
pop rbx
cmp rax, rbx
cmovne rcx, rdx
push rcx
%line 24+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
test rax, rax
jz addr_1848; if
%line 24+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
%line 24+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
%line 24+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, -22
push rax
%line 24+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 24+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
ret
%line 24+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
addr_1848: ; endif
%line 25+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
push 1
pop rbx
pop rax
add rax, rbx
push rax
%line 25+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 25+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, 8
push rax
%line 25+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rcx
pop rbx
shl rbx, cl
push rbx
%line 25+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 25+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
call usr_ipv4_parse_octet
%line 26+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
push rax
push rax
%line 26+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, 0
push rax
%line 26+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rcx, 0
mov rdx, 1
pop rbx
pop rax
cmp rax, rbx
cmovl rcx, rdx
push rcx
%line 26+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
test rax, rax
jz addr_1865; if
%line 26+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
%line 26+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
%line 26+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
%line 26+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, -22
push rax
%line 26+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 26+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
ret
%line 26+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
addr_1865: ; endif
%line 27+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 27+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
pop rcx
push rax
push rbx
push rcx
%line 27+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rbx
pop rax
or rbx, rax
push rbx
%line 27+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 29+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
push rax
push rax
%line 29+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
movzx ebx, byte [rax]
push rbx
%line 29+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, 46
push rax
%line 29+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rcx, 0
mov rdx, 1
pop rax
pop rbx
cmp rax, rbx
cmovne rcx, rdx
push rcx
%line 29+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
test rax, rax
jz addr_1880; if
%line 29+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
%line 29+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
%line 29+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, -22
push rax
%line 29+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 29+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
ret
%line 29+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
addr_1880: ; endif
%line 30+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
push 1
pop rbx
pop rax
add rax, rbx
push rax
%line 30+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 30+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, 8
push rax
%line 30+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rcx
pop rbx
shl rbx, cl
push rbx
%line 30+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 30+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
call usr_ipv4_parse_octet
%line 31+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
push rax
push rax
%line 31+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, 0
push rax
%line 31+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rcx, 0
mov rdx, 1
pop rbx
pop rax
cmp rax, rbx
cmovl rcx, rdx
push rcx
%line 31+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
test rax, rax
jz addr_1897; if
%line 31+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
%line 31+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
%line 31+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
%line 31+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, -22
push rax
%line 31+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 31+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
ret
%line 31+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
addr_1897: ; endif
%line 32+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 32+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
pop rcx
push rax
push rbx
push rcx
%line 32+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rbx
pop rax
or rbx, rax
push rbx
%line 32+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 34+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
push rax
push rax
%line 34+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
movzx ebx, byte [rax]
push rbx
%line 34+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, 46
push rax
%line 34+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rcx, 0
mov rdx, 1
pop rax
pop rbx
cmp rax, rbx
cmovne rcx, rdx
push rcx
%line 34+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
test rax, rax
jz addr_1912; if
%line 34+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
%line 34+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
%line 34+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, -22
push rax
%line 34+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 34+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
ret
%line 34+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
addr_1912: ; endif
%line 35+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
push 1
pop rbx
pop rax
add rax, rbx
push rax
%line 35+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 35+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, 8
push rax
%line 35+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rcx
pop rbx
shl rbx, cl
push rbx
%line 35+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 35+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
call usr_ipv4_parse_octet
%line 36+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
push rax
push rax
%line 36+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, 0
push rax
%line 36+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rcx, 0
mov rdx, 1
pop rbx
pop rax
cmp rax, rbx
cmovl rcx, rdx
push rcx
%line 36+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
test rax, rax
jz addr_1929; if
%line 36+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
%line 36+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
%line 36+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
%line 36+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, -22
push rax
%line 36+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 36+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
ret
%line 36+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
addr_1929: ; endif
%line 37+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 37+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
pop rcx
push rax
push rbx
push rcx
%line 37+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rbx
pop rax
or rbx, rax
push rbx
%line 37+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 39+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
movzx ebx, byte [rax]
push rbx
%line 39+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, 0
push rax
%line 39+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rcx, 0
mov rdx, 1
pop rax
pop rbx
cmp rax, rbx
cmovne rcx, rdx
push rcx
%line 39+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
test rax, rax
jz addr_1942; if
%line 39+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
%line 39+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
mov rax, -22
push rax
%line 39+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 39+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
ret
%line 39+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
addr_1942: ; endif
%line 40+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
pop rax
pop rbx
push rax
push rbx
%line 41+0 /home/ges/doc/src/github.com/alchemyc/lib/std/net/ipv4.alc
ret
%line 1+0 /home/ges/doc/src/github.com/alchemyc/lib/std/bool.alc
%line 1+0 /home/ges/doc/src/github.com/alchemyc/lib/std/bool.alc
usr_true:
%line 1+0 /home/ges/doc/src/github.com/alchemyc/lib/std/bool.alc
mov rax, 1
push rax
%line 1+0 /home/ges/doc/src/github.com/alchemyc/lib/std/bool.alc
pop rax
pop rbx
push rax
push rbx
%line 1+0 /home/ges/doc/src/github.com/alchemyc/lib/std/bool.alc
ret
%line 2+0 /home/ges/doc/src/github.com/alchemyc/lib/std/bool.alc
%line 2+0 /home/ges/doc/src/github.com/alchemyc/lib/std/bool.alc
usr_false:
%line 2+0 /home/ges/doc/src/github.com/alchemyc/lib/std/bool.alc
mov rax, 0
push rax
%line 2+0 /home/ges/doc/src/github.com/alchemyc/lib/std/bool.alc
pop rax
pop rbx
push rax
push rbx
%line 2+0 /home/ges/doc/src/github.com/alchemyc/lib/std/bool.alc
ret
%line 3+0 /home/ges/doc/src/github.com/alchemyc/lib/std/str.alc
%line 3+0 /home/ges/doc/src/github.com/alchemyc/lib/std/str.alc
usr_STR_NEWLINE:
%line 3+0 /home/ges/doc/src/github.com/alchemyc/lib/std/str.alc
push lit_1957
%line 3+0 /home/ges/doc/src/github.com/alchemyc/lib/std/str.alc
pop rax
pop rbx
push rax
push rbx
%line 3+0 /home/ges/doc/src/github.com/alchemyc/lib/std/str.alc
ret
%line 4+0 /home/ges/doc/src/github.com/alchemyc/lib/std/str.alc
%line 4+0 /home/ges/doc/src/github.com/alchemyc/lib/std/str.alc
usr_strlen:
%line 8+0 /home/ges/doc/src/github.com/alchemyc/lib/std/str.alc
pop rax
pop rbx
push rax
push rbx
%line 8+0 /home/ges/doc/src/github.com/alchemyc/lib/std/str.alc
mov rax, 0
push rax
%line 8+0 /home/ges/doc/src/github.com/alchemyc/lib/std/str.alc
pop rax
pop rbx
push rax
push rbx
%line 9+0 /home/ges/doc/src/github.com/alchemyc/lib/std/str.alc
addr_1975: ; while
%line 9+0 /home/ges/doc/src/github.com/alchemyc/lib/std/str.alc
pop rax
push rax
push rax
%line 9+0 /home/ges/doc/src/github.com/alchemyc/lib/std/str.alc
pop rax
movzx ebx, byte [rax]
push rbx
%line 9+0 /home/ges/doc/src/github.com/alchemyc/lib/std/str.alc
mov rax, 0
push rax
%line 9+0 /home/ges/doc/src/github.com/alchemyc/lib/std/str.alc
mov rcx, 0
mov rdx, 1
pop rbx
pop rax
cmp rax, rbx
cmovg rcx, rdx
push rcx
%line 9+0 /home/ges/doc/src/github.com/alchemyc/lib/std/str.alc
pop rax
test rax, rax
jz addr_1985; if
%line 10+0 /home/ges/doc/src/github.com/alchemyc/lib/std/str.alc
push 1
pop rbx
pop rax
add rax, rbx
push rax
%line 10+0 /home/ges/doc/src/github.com/alchemyc/lib/std/str.alc
pop rax
pop rbx
push rax
push rbx
%line 10+0 /home/ges/doc/src/github.com/alchemyc/lib/std/str.alc
push 1
pop rbx
pop rax
add rax, rbx
push rax
%line 10+0 /home/ges/doc/src/github.com/alchemyc/lib/std/str.alc
pop rax
pop rbx
push rax
push rbx
%line 11+0 /home/ges/doc/src/github.com/alchemyc/lib/std/str.alc
jmp addr_1975
addr_1985: ; else
%line 12+0 /home/ges/doc/src/github.com/alchemyc/lib/std/str.alc
pop rax
%line 12+0 /home/ges/doc/src/github.com/alchemyc/lib/std/str.alc
pop rax
pop rbx
push rax
push rbx
%line 13+0 /home/ges/doc/src/github.com/alchemyc/lib/std/str.alc
ret
%line 15+0 /home/ges/doc/src/github.com/alchemyc/lib/std/str.alc
%line 15+0 /home/ges/doc/src/github.com/alchemyc/lib/std/str.alc
usr_FD_STDOUT:
%line 1+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/fd.alc
mov rax, 1
push rax
%line 1+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/fd.alc
pop rax
pop rbx
push rax
push rbx
%line 1+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/fd.alc
ret
%line 2+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/fd.alc
%line 2+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/fd.alc
usr_FD_STDERR:
%line 2+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/fd.alc
mov rax, 2
push rax
%line 2+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/fd.alc
pop rax
pop rbx
push rax
push rbx
%line 2+0 /home/ges/doc/src/github.com/alchemyc/lib/std/sys/fd.alc
ret
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
%line 5+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
usr_print:
%line 6+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 6+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
push rax
push rax
%line 6+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
call usr_strlen
%line 6+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 6+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
call usr_FD_STDOUT
%line 6+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
call usr_SYS_WRITE
%line 6+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
pop rdi
pop rsi
pop rdx
syscall
push rax
%line 6+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
%line 7+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
ret
%line 9+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
%line 9+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
usr_printe:
%line 10+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 10+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
push rax
push rax
%line 10+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
call usr_strlen
%line 10+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 10+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
call usr_FD_STDERR
%line 10+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
call usr_SYS_WRITE
%line 10+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
pop rdi
pop rsi
pop rdx
syscall
push rax
%line 10+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
%line 11+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
ret
%line 13+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
%line 13+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
usr_println:
%line 14+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 14+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
call usr_print
%line 14+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
call usr_STR_NEWLINE
%line 14+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
call usr_print
%line 15+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
ret
%line 17+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
%line 17+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
usr_printeln:
%line 18+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 18+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
call usr_printe
%line 18+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
call usr_STR_NEWLINE
%line 18+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
call usr_printe
%line 19+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
ret
%line 21+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
%line 21+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
usr_exit:
%line 22+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 22+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
call usr_SYS_EXIT
%line 22+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
pop rdi
syscall
push rax
%line 23+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
ret
%line 25+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
%line 25+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
usr_printx:
%line 26+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 27+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
push lit_2181
%line 27+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
call usr_print
%line 28+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
mov rax, 0
push rax
%line 29+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
mov rax, 1
push rax
%line 29+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
addr_2185: ; while
%line 29+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
test rax, rax
jz addr_2202; if
%line 30+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 31+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
push rax
push rax
%line 31+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
mov rax, 15
push rax
%line 31+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rbx
pop rax
and rbx, rax
push rbx
%line 31+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
push lit_2191
%line 31+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rbx
pop rax
add rax, rbx
push rax
%line 32+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
pop rbx
pop rcx
push rax
push rbx
push rcx
%line 32+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 33+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
mov rax, 4
push rax
%line 33+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rcx
pop rbx
shr rbx, cl
push rbx
%line 34+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 34+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
mov rax, 1
push rax
%line 34+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rbx
pop rax
add rax, rbx
push rax
%line 35+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rbx
pop rax
push rax
push rbx
push rax
push rbx
%line 35+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
%line 36+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
jmp addr_2185
addr_2202: ; else
%line 38+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 38+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
%line 40+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
addr_2205: ; while
%line 40+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
push rax
push rax
%line 40+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
test rax, rax
jz addr_2217; if
%line 41+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 42+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
mov rax, 1
push rax
%line 42+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
pop rbx
push rax
push rbx
%line 42+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
call usr_FD_STDOUT
%line 42+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
call usr_SYS_WRITE
%line 42+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
pop rdi
pop rsi
pop rdx
syscall
push rax
%line 42+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
%line 43+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
mov rax, 1
push rax
%line 43+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rbx
pop rax
sub rax, rbx
push rax
%line 44+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
jmp addr_2205
addr_2217: ; else
%line 45+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
pop rax
%line 46+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
ret
%line 48+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
%line 48+0 /home/ges/doc/src/github.com/alchemyc/lib/std/io.alc
usr_main:
%line 7+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
call usr_socket_tcp
%line 8+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
push rax
push rax
%line 8+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rax, 0
push rax
%line 8+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rcx, 0
mov rdx, 1
pop rbx
pop rax
cmp rax, rbx
cmovl rcx, rdx
push rcx
%line 8+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
test rax, rax
jz addr_2239; if
%line 9+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
%line 10+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
push lit_2235
%line 10+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
call usr_printeln
%line 11+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rax, 1
push rax
%line 11+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
call usr_exit
%line 12+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
addr_2239: ; endif
%line 14+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
push rax
push rax
%line 14+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
push lit_2241
%line 14+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
call usr_ipv4_parse
%line 14+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rax, 8080
push rax
%line 14+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
call usr_socket_connect_ipv4
%line 15+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rax, 0
push rax
%line 15+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rcx, 0
mov rdx, 1
pop rbx
pop rax
cmp rax, rbx
cmovl rcx, rdx
push rcx
%line 15+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
test rax, rax
jz addr_2254; if
%line 16+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
call usr_socket_close
%line 16+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
%line 17+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
push lit_2250
%line 17+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
call usr_printeln
%line 18+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rax, 1
push rax
%line 18+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
call usr_exit
%line 19+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
addr_2254: ; endif
%line 21+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
push rax
push rax
%line 21+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
push lit_2256
%line 21+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rax, 4
push rax
%line 21+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
call usr_socket_write
%line 22+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rax, 4
push rax
%line 22+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rcx, 0
mov rdx, 1
pop rax
pop rbx
cmp rax, rbx
cmovne rcx, rdx
push rcx
%line 22+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
test rax, rax
jz addr_2268; if
%line 23+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
call usr_socket_close
%line 23+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
%line 24+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
push lit_2264
%line 24+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
call usr_printeln
%line 25+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rax, 1
push rax
%line 25+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
call usr_exit
%line 26+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
addr_2268: ; endif
%line 28+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rax, 4
push rax
%line 28+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
call usr_mem_alloc
%line 29+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
push rax
push rax
%line 29+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rax, 0
push rax
%line 29+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rcx, 0
mov rdx, 1
pop rbx
pop rax
cmp rax, rbx
cmovl rcx, rdx
push rcx
%line 29+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
test rax, rax
jz addr_2282; if
%line 30+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
%line 31+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
call usr_socket_close
%line 31+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
%line 32+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
push lit_2278
%line 32+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
call usr_printeln
%line 33+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rax, 1
push rax
%line 33+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
call usr_exit
%line 34+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
addr_2282: ; endif
%line 36+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rbx
pop rax
push rax
push rbx
push rax
push rbx
%line 36+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rax, 4
push rax
%line 36+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
call usr_socket_read
%line 37+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rax, 4
push rax
%line 37+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rcx, 0
mov rdx, 1
pop rax
pop rbx
cmp rax, rbx
cmove rcx, rdx
push rcx
%line 37+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
test rax, rax
jz addr_2323; if
%line 38+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
push rax
push rax
%line 38+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
movzx ebx, byte [rax]
push rbx
%line 38+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rax, 112
push rax
%line 38+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rcx, 0
mov rdx, 1
pop rax
pop rbx
cmp rax, rbx
cmove rcx, rdx
push rcx
%line 39+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
pop rbx
push rax
push rbx
%line 39+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
push rax
push rax
%line 39+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rax, 1
push rax
%line 39+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rbx
pop rax
add rax, rbx
push rax
%line 39+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
movzx ebx, byte [rax]
push rbx
%line 39+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rax, 111
push rax
%line 39+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rcx, 0
mov rdx, 1
pop rax
pop rbx
cmp rax, rbx
cmove rcx, rdx
push rcx
%line 40+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
pop rbx
push rax
push rbx
%line 40+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
pop rbx
pop rcx
push rax
push rbx
push rcx
%line 40+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rbx
pop rax
and rbx, rax
push rbx
%line 41+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
pop rbx
push rax
push rbx
%line 41+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
push rax
push rax
%line 41+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rax, 2
push rax
%line 41+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rbx
pop rax
add rax, rbx
push rax
%line 41+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
movzx ebx, byte [rax]
push rbx
%line 41+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rax, 110
push rax
%line 41+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rcx, 0
mov rdx, 1
pop rax
pop rbx
cmp rax, rbx
cmove rcx, rdx
push rcx
%line 42+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
pop rbx
push rax
push rbx
%line 42+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
pop rbx
pop rcx
push rax
push rbx
push rcx
%line 42+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rbx
pop rax
and rbx, rax
push rbx
%line 43+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
pop rbx
push rax
push rbx
%line 43+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
push rax
push rax
%line 43+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rax, 3
push rax
%line 43+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rbx
pop rax
add rax, rbx
push rax
%line 43+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
movzx ebx, byte [rax]
push rbx
%line 43+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rax, 103
push rax
%line 43+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rcx, 0
mov rdx, 1
pop rax
pop rbx
cmp rax, rbx
cmove rcx, rdx
push rcx
%line 44+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
pop rbx
push rax
push rbx
%line 44+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
pop rbx
pop rcx
push rax
push rbx
push rcx
%line 44+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rbx
pop rax
and rbx, rax
push rbx
%line 45+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
jmp addr_2325
addr_2323: ; else
%line 46+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rax, 0
push rax
%line 47+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
addr_2325: ; endif
%line 49+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
pop rbx
push rax
push rbx
%line 49+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rax, 4
push rax
%line 49+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
call usr_mem_free
%line 49+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
%line 50+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
pop rbx
push rax
push rbx
%line 50+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
call usr_socket_close
%line 50+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
%line 52+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
pop rax
test rax, rax
jz addr_2336; if
%line 53+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
push lit_2334
%line 53+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
call usr_println
%line 54+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
jmp addr_2341
addr_2336: ; else
%line 55+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
push lit_2337
%line 55+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
call usr_printeln
%line 56+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
mov rax, 1
push rax
%line 56+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
call usr_exit
%line 57+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
addr_2341: ; endif
%line 58+0 /home/ges/doc/src/github.com/alchemyc/socket_test.alc
ret

_start:
call usr_main
mov rax, 60
mov rdi, 0
syscall

segment .rodata
hex_digits: db "0123456789abcdef"
lit_1957: db `\n`, 0x00
lit_1962: db `0123456789ABCDEF`, 0x00
lit_1967: db `0123456789abcdef`, 0x00
lit_2181: db `0x`, 0x00
lit_2191: db `0123456789abcdef`, 0x00
lit_2224: db ``, 0x00
lit_2235: db `socket creation failed`, 0x00
lit_2241: db `127.0.0.1`, 0x00
lit_2250: db `connection failed`, 0x00
lit_2256: db `ping`, 0x00
lit_2264: db `send failed or was incomplete`, 0x00
lit_2278: db `allocation failed`, 0x00
lit_2334: db `received pong`, 0x00
lit_2337: db `receive failed, was incomplete, or was not pong`, 0x00

segment .bss
mem: resb 640000
