use std::borrow::Cow;

use crate::{assembly::Assembly, resolver::FileTable, token::Token};

pub struct AssemblyGenerator;

impl AssemblyGenerator {
    pub fn generate(tokens: &[Token], files: &FileTable) -> Assembly {
        let mut tokens_assembled: Vec<String> = Vec::new();
        for token in tokens {
            let asm = token.to_asm();
            let context = token.context();
            let file = files.path(context.file);
            tokens_assembled.push(format!("%line {}+0 {}", context.line, file.display()));
            // TODO unnecessary clone here
            for instr in asm {
                tokens_assembled.push(instr.to_string());
            }
        }
        let tokens_src = tokens_assembled.join("\n");
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

{tokens_src}

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
