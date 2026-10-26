use std::borrow::Cow;

use crate::{assembly::Assembly, token::Token};

pub struct AssemblyGenerator;

impl AssemblyGenerator {
    pub fn generate(tokens: &[Token]) -> Assembly {
        let token_src = tokens
            .iter()
            .flat_map(Token::to_asm)
            .collect::<Vec<Cow<'static, str>>>()
            .join("\n");
        let literals_src = tokens
            .iter()
            .flat_map(Token::to_lit)
            .collect::<Vec<Cow<'static, str>>>()
            .join("\n");
        let src = format!(
            r#"
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

{token_src}

_start:
call usr_main
mov rax, 60
mov rdi, 0
syscall

segment .rodata
hex_digits: db "0123456789abcdef"
{literals_src}

segment .bss
mem: resb 640000
"#
        );
        Assembly(src)
    }
}
