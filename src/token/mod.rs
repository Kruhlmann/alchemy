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
            Token::Atomic(AtomicToken::Equal, _) => asm!["mov rcx, 0", "mov rdx, 1", "pop rax", "pop rbx", "cmp rax, rbx", "cmove rcx, rdx", "push rcx"],
            Token::Atomic(AtomicToken::GreaterThan, _) => asm!["mov rcx, 0", "mov rdx, 1", "pop rbx", "pop rax", "cmp rax, rbx", "cmovg rcx, rdx", "push rcx"],
            Token::Atomic(AtomicToken::GreaterThanOrEqual, _) => asm!["mov rcx, 0", "mov rdx, 1", "pop rbx", "pop rax", "cmp rax, rbx", "cmovge rcx, rdx", "push rcx"],
            Token::Atomic(AtomicToken::Increment, _) => asm!["push 1", "pop rbx", "pop rax", "add rax, rbx", "push rax"],
            Token::Atomic(AtomicToken::LessThan, _) => asm!["mov rcx, 0", "mov rdx, 1", "pop rbx", "pop rax", "cmp rax, rbx", "cmovl rcx, rdx", "push rcx"],
            Token::Atomic(AtomicToken::LessThanOrEqual, _) => asm!["mov rcx, 0", "mov rdx, 1", "pop rbx", "pop rax", "cmp rax, rbx", "cmovle rcx, rdx", "push rcx"],
            Token::Atomic(AtomicToken::NotEqual, _) => asm!["mov rcx, 0", "mov rdx, 1", "pop rax", "pop rbx", "cmp rax, rbx", "cmovne rcx, rdx", "push rcx"],
            Token::Atomic(AtomicToken::PopDrop, _) => asm!["pop rax"],
            Token::Atomic(AtomicToken::PushInteger(s), _) => asm![format!("push {s}")],
            Token::Atomic(AtomicToken::Put, _) => asm!["call put"],
            Token::Atomic(AtomicToken::Return, _) => asm!["ret"],
            Token::Atomic(AtomicToken::Reverse3, _) => asm!["pop rax", "pop rbx", "pop rcx", "push rax", "push rbx", "push rcx"],
            Token::Atomic(AtomicToken::Sub, _) => asm![],
            Token::Atomic(AtomicToken::SubDefinition(s), _) => asm![format!("usr_{s}:")],
            Token::Atomic(AtomicToken::Subtract, _) => asm!["pop rbx", "pop rax", "sub rax, rbx", "push rax"],
            Token::Atomic(AtomicToken::Swap, _) => asm!["pop rax", "pop rbx", "push rax", "push rbx"],
            Token::Atomic(AtomicToken::Over, _) => asm!["pop rax", "pop rbx", "push rbx", "push rax"],
            Token::Atomic(AtomicToken::Syscall0, _) => asm!["pop rax", "syscall"],
            Token::Atomic(AtomicToken::Syscall1, _) => asm!["pop rax", "pop rdi", "syscall"],
            Token::Atomic(AtomicToken::Syscall2, _) => panic!("syscall2 unsupported"),
            Token::Atomic(AtomicToken::Syscall3, _) => asm!["pop rax", "pop rdi", "pop rsi", "pop rdx", "syscall"],
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
