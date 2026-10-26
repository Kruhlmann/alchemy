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
