pub mod atomic;
pub mod context;
pub mod error;
pub mod linkable;
pub mod unlinked;

pub use atomic::*;
pub use context::*;
pub use error::*;
pub use linkable::*;
pub use unlinked::*;

macro_rules! asm {
    ($($line:expr),* $(,)?) => {
        vec![$(std::borrow::Cow::<'static, str>::from($line)),*]
    };
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::resolver::FileId;

    #[test]
    fn syscall_registers_and_results() {
        let context = TokenContext {
            line: 0,
            column: 0,
            file: FileId(0),
        };
        let registers = ["rdi", "rsi", "rdx", "r10", "r8", "r9"];
        for arity in 0..=6 {
            let source = format!("syscall{arity}");
            let UnlinkedToken::Atomic(atomic, _) =
                UnlinkedToken::try_from_source(&source, context).unwrap()
            else {
                panic!("syscall must be atomic");
            };
            assert!(!matches!(atomic, AtomicToken::CallSub(_)));
            let mut expected = vec!["pop rax".to_owned()];
            expected.extend(registers[..arity].iter().map(|r| format!("pop {r}")));
            expected.extend(["syscall".to_owned(), "push rax".to_owned()]);
            assert_eq!(Token::Atomic(atomic, context).to_asm(), expected);
        }
    }

    #[test]
    fn memory_load_widths_and_zero_extension() {
        let context = TokenContext {
            line: 0,
            column: 0,
            file: FileId(0),
        };
        for (source, instruction) in [
            ("*", "movzx ebx, byte [rax]"),
            ("readb", "movzx ebx, byte [rax]"),
            ("readw", "movzx ebx, word [rax]"),
            ("readd", "mov ebx, dword [rax]"),
            ("readq", "mov rbx, qword [rax]"),
        ] {
            let UnlinkedToken::Atomic(atomic, _) =
                UnlinkedToken::try_from_source(source, context).unwrap()
            else {
                panic!("memory load must be atomic");
            };
            assert_eq!(
                Token::Atomic(atomic, context).to_asm(),
                vec!["pop rax", instruction, "push rbx"],
                "{source}"
            );
        }
    }
}

#[derive(Debug, Clone)]
pub enum Token {
    Atomic(AtomicToken, TokenContext),
    Linked {
        token: LinkableTokenType,
        link: usize,
        context: TokenContext,
    },
    DualLinked {
        token: LinkableTokenType,
        link_a: usize,
        link_b: usize,
        context: TokenContext,
    },
}

impl std::fmt::Display for Token {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Token::Atomic(atomic_token, ..) => write!(f, "{atomic_token:?}"),
            Token::Linked { token, link, .. } => write!(f, "{token:?} -> {link}"),
            Token::DualLinked {
                token,
                link_a,
                link_b,
                ..
            } => write!(f, "{token:?} -> {link_a}/{link_b}"),
        }
    }
}

impl Token {
    pub fn context(&self) -> TokenContext {
        match self {
            Token::Atomic(_, token_context) => *token_context,
            Token::Linked { context, .. } => *context,
            Token::DualLinked { context, .. } => *context,
        }
    }

    pub fn linked(token: LinkableTokenType, link: usize, context: TokenContext) -> Self {
        let ret = Self::Linked {
            token,
            link,
            context,
        };
        tracing::debug!(token = %ret, "link token");
        ret
    }

    pub fn doubly_linked(
        token: LinkableTokenType,
        link_a: usize,
        link_b: usize,
        context: TokenContext,
    ) -> Self {
        Self::DualLinked {
            token,
            link_a,
            link_b,
            context,
        }
    }

    #[rustfmt::skip]
    pub fn to_asm(&self) -> Vec<std::borrow::Cow<'static, str>> {
        match self {
            Token::Atomic(AtomicToken::Add, _) => asm!["pop rbx", "pop rax", "add rax, rbx", "push rax"],
            Token::Atomic(AtomicToken::BitwiseAnd, _) => asm!["pop rbx", "pop rax", "and rbx, rax", "push rbx"],
            Token::Atomic(AtomicToken::BitwiseOr, _) => asm!["pop rbx", "pop rax", "or rbx, rax", "push rbx"],
            Token::Atomic(AtomicToken::BitwiseShiftLeft, _) => asm!["pop rcx", "pop rbx", "shl rbx, cl", "push rbx"],
            Token::Atomic(AtomicToken::BitwiseShiftRight, _) => asm!["pop rcx", "pop rbx", "shr rbx, cl", "push rbx"],
            Token::Atomic(AtomicToken::CallSub(s), _) => asm![format!("call usr_{s}")],
            Token::Atomic(AtomicToken::Clone, _) => asm!["pop rax", "push rax", "push rax"],
            Token::Atomic(AtomicToken::Clone2, _) => asm!["pop rbx", "pop rax", "push rax", "push rbx", "push rax", "push rbx"],
            Token::Atomic(AtomicToken::Decrement, _) => asm!["push 1", "pop rbx", "pop rax", "sub rax, rbx", "push rax"],
            Token::Atomic(AtomicToken::DereferenceBytePtr, _) => asm!["pop rax", "movzx ebx, byte [rax]", "push rbx"],
            Token::Atomic(AtomicToken::DereferenceWordPtr, _) => asm!["pop rax", "movzx ebx, word [rax]", "push rbx"],
            Token::Atomic(AtomicToken::DereferenceDwordPtr, _) => asm!["pop rax", "mov ebx, dword [rax]", "push rbx"],
            Token::Atomic(AtomicToken::DereferenceQwordPtr, _) => asm!["pop rax", "mov rbx, qword [rax]", "push rbx"],
            Token::Atomic(AtomicToken::Equal, _) => asm!["mov rcx, 0", "mov rdx, 1", "pop rax", "pop rbx", "cmp rax, rbx", "cmove rcx, rdx", "push rcx"],
            Token::Atomic(AtomicToken::GreaterThan, _) => asm!["mov rcx, 0", "mov rdx, 1", "pop rbx", "pop rax", "cmp rax, rbx", "cmovg rcx, rdx", "push rcx"],
            Token::Atomic(AtomicToken::GreaterThanOrEqual, _) => asm!["mov rcx, 0", "mov rdx, 1", "pop rbx", "pop rax", "cmp rax, rbx", "cmovge rcx, rdx", "push rcx"],
            Token::Atomic(AtomicToken::Increment, _) => asm!["push 1", "pop rbx", "pop rax", "add rax, rbx", "push rax"],
            Token::Atomic(AtomicToken::LessThan, _) => asm!["mov rcx, 0", "mov rdx, 1", "pop rbx", "pop rax", "cmp rax, rbx", "cmovl rcx, rdx", "push rcx"],
            Token::Atomic(AtomicToken::LessThanOrEqual, _) => asm!["mov rcx, 0", "mov rdx, 1", "pop rbx", "pop rax", "cmp rax, rbx", "cmovle rcx, rdx", "push rcx"],
            Token::Atomic(AtomicToken::NotEqual, _) => asm!["mov rcx, 0", "mov rdx, 1", "pop rax", "pop rbx", "cmp rax, rbx", "cmovne rcx, rdx", "push rcx"],
            Token::Atomic(AtomicToken::PopDrop, _) => asm!["pop rax"],
            Token::Atomic(AtomicToken::PushInteger(s), _) => asm![format!("mov rax, {s}"), "push rax"],
            Token::Atomic(AtomicToken::Return, _) => asm!["ret"],
            Token::Atomic(AtomicToken::Reverse3, _) => asm!["pop rax", "pop rbx", "pop rcx", "push rax", "push rbx", "push rcx"],
            Token::Atomic(AtomicToken::Reverse4, _) => asm!["pop rax", "pop rbx", "pop rcx", "pop rdx", "push rax", "push rbx", "push rcx", "push rdx"],
            Token::Atomic(AtomicToken::Reverse6, _) => asm!["pop rax", "pop rbx", "pop rcx", "pop rdx", "pop r8", "pop r9", "push rax", "push rbx", "push rcx", "push rdx", "push r8", "push r9"],
            Token::Atomic(AtomicToken::Sub, _) => asm![],
            Token::Atomic(AtomicToken::SubDefinition(s), _) => asm![format!("usr_{s}:")],
            Token::Atomic(AtomicToken::Subtract, _) => asm!["pop rbx", "pop rax", "sub rax, rbx", "push rax"],
            Token::Atomic(AtomicToken::Swap, _) => asm!["pop rax", "pop rbx", "push rax", "push rbx"],
            Token::Atomic(AtomicToken::Over, _) => asm!["pop rax", "pop rbx", "push rbx", "push rax", "push rbx"],
            Token::Atomic(AtomicToken::Syscall0, _) => asm!["pop rax", "syscall", "push rax"],
            Token::Atomic(AtomicToken::Syscall1, _) => asm!["pop rax", "pop rdi", "syscall", "push rax"],
            Token::Atomic(AtomicToken::Syscall2, _) => asm!["pop rax", "pop rdi", "pop rsi", "syscall", "push rax"],
            Token::Atomic(AtomicToken::Syscall3, _) => asm!["pop rax", "pop rdi", "pop rsi", "pop rdx", "syscall", "push rax"],
            Token::Atomic(AtomicToken::Syscall4, _) => asm!["pop rax", "pop rdi", "pop rsi", "pop rdx", "pop r10", "syscall", "push rax"],
            Token::Atomic(AtomicToken::Syscall5, _) => asm!["pop rax", "pop rdi", "pop rsi", "pop rdx", "pop r10", "pop r8", "syscall", "push rax"],
            Token::Atomic(AtomicToken::Syscall6, _) => asm!["pop rax", "pop rdi", "pop rsi", "pop rdx", "pop r10", "pop r8", "pop r9", "syscall", "push rax"],
            Token::Atomic(AtomicToken::Write, _) => asm!["pop rbx", "pop rax", "mov [rax], rbx"],
            Token::Atomic(AtomicToken::WriteByte, _) => asm!["pop rbx", "pop rax", "mov byte [rax], bl"],
            Token::Linked { token: LinkableTokenType::EndIf, link, .. } => asm![format!("addr_{link}: ; endif")],
            Token::Linked { token: LinkableTokenType::While, link, .. } => asm![format!("addr_{link}: ; while")],
            Token::Linked { token: LinkableTokenType::If, link, .. } => asm!["pop rax", "test rax, rax", format!("jz addr_{}; if", link)],
            Token::Linked { token: LinkableTokenType::Do, link, .. } => asm!["pop rax", "test rax, rax", format!("jz addr_{}; if", link)],
            Token::Linked { token: LinkableTokenType::Marine, .. } => asm!["ret"],
            Token::Linked { token: LinkableTokenType::PushStaticStringPtr(..), link, .. } => asm![format!("push lit_{link}")],
            Token::Linked { token: LinkableTokenType::Sub, .. } => asm![],
            Token::DualLinked { token: LinkableTokenType::Wend, link_a, link_b, .. } => asm![format!("jmp addr_{link_a}"), format!("addr_{link_b}: ; wend")],
            Token::DualLinked { token: LinkableTokenType::Else, link_a, link_b, .. } => asm![format!("jmp addr_{link_a}"), format!("addr_{link_b}: ; else")],

            // TODO:
            Token::Atomic { .. } => panic!("unhandled atomic token: {self:?}"),
            Token::Linked { .. } => panic!("unhandled linked token: {self:?}"),
            Token::DualLinked { .. } => panic!("unhandled dual linked token: {self:?}"),
        }
    }
    pub fn to_lit(&self) -> Vec<std::borrow::Cow<'static, str>> {
        match self {
            Token::Linked {
                token: LinkableTokenType::PushStaticStringPtr(value),
                link,
                ..
            } => {
                asm![format!("lit_{link}: db `{value}`, 0x00")]
            }
            _ => asm![],
        }
    }
}
