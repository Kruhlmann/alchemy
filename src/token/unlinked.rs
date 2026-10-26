use crate::token::{AtomicToken, LinkableTokenType, TokenContext, TokenParseError};

#[derive(Debug, Clone)]
pub enum UnlinkedToken {
    Atomic(AtomicToken, TokenContext),
    Linkable(LinkableTokenType, TokenContext),
}

impl std::fmt::Display for UnlinkedToken {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            UnlinkedToken::Atomic(atomic_token, token_context) => write!(
                f,
                "{atomic_token:?} @ {}:{}",
                token_context.line, token_context.column
            ),
            UnlinkedToken::Linkable(linkable_token_type, token_context) => write!(
                f,
                "{linkable_token_type:?} @ {}:{}",
                token_context.line, token_context.column
            ),
        }
    }
}

impl UnlinkedToken {
    pub fn try_from_source(v: &str, c: TokenContext) -> Result<Self, TokenParseError> {
        match v {
            "!=" => return Ok(UnlinkedToken::Atomic(AtomicToken::NotEqual, c)),
            "&" => return Ok(UnlinkedToken::Atomic(AtomicToken::BitwiseAnd, c)),
            "*" => return Ok(UnlinkedToken::Atomic(AtomicToken::DereferenceBytePtr, c)),
            "+" => return Ok(UnlinkedToken::Atomic(AtomicToken::Add, c)),
            "++" => return Ok(UnlinkedToken::Atomic(AtomicToken::Increment, c)),
            "-" => return Ok(UnlinkedToken::Atomic(AtomicToken::Subtract, c)),
            "--" => return Ok(UnlinkedToken::Atomic(AtomicToken::Decrement, c)),
            "<" => return Ok(UnlinkedToken::Atomic(AtomicToken::LessThan, c)),
            "<<" => return Ok(UnlinkedToken::Atomic(AtomicToken::BitwiseShiftLeft, c)),
            "<=" => return Ok(UnlinkedToken::Atomic(AtomicToken::LessThanOrEqual, c)),
            "=" => return Ok(UnlinkedToken::Atomic(AtomicToken::Equal, c)),
            ">" => return Ok(UnlinkedToken::Atomic(AtomicToken::GreaterThan, c)),
            ">=" => {
                return Ok(UnlinkedToken::Atomic(AtomicToken::GreaterThanOrEqual, c));
            }
            ">>" => return Ok(UnlinkedToken::Atomic(AtomicToken::BitwiseShiftRight, c)),
            "clone" => return Ok(UnlinkedToken::Atomic(AtomicToken::Clone, c)),
            "clone2" => return Ok(UnlinkedToken::Atomic(AtomicToken::Clone2, c)),
            "drop" => return Ok(UnlinkedToken::Atomic(AtomicToken::PopDrop, c)),
            "over" => return Ok(UnlinkedToken::Atomic(AtomicToken::Over, c)),
            "return" => return Ok(UnlinkedToken::Atomic(AtomicToken::Return, c)),
            "rev3" => return Ok(UnlinkedToken::Atomic(AtomicToken::Reverse3, c)),
            "swap" => return Ok(UnlinkedToken::Atomic(AtomicToken::Swap, c)),
            "syscall0" => return Ok(UnlinkedToken::Atomic(AtomicToken::Syscall0, c)),
            "syscall1" => return Ok(UnlinkedToken::Atomic(AtomicToken::Syscall1, c)),
            "syscall2" => return Ok(UnlinkedToken::Atomic(AtomicToken::Syscall2, c)),
            "syscall3" => return Ok(UnlinkedToken::Atomic(AtomicToken::Syscall3, c)),
            "syscall4" => return Ok(UnlinkedToken::Atomic(AtomicToken::Syscall4, c)),
            "syscall5" => return Ok(UnlinkedToken::Atomic(AtomicToken::Syscall5, c)),
            "syscall6" => return Ok(UnlinkedToken::Atomic(AtomicToken::Syscall6, c)),
            "write" => return Ok(UnlinkedToken::Atomic(AtomicToken::Write, c)),
            "writeb" => return Ok(UnlinkedToken::Atomic(AtomicToken::WriteByte, c)),
            "|" => return Ok(UnlinkedToken::Atomic(AtomicToken::BitwiseOr, c)),
            "do" => return Ok(UnlinkedToken::Linkable(LinkableTokenType::Do, c)),
            "else" => return Ok(UnlinkedToken::Linkable(LinkableTokenType::Else, c)),
            "endif" => return Ok(UnlinkedToken::Linkable(LinkableTokenType::EndIf, c)),
            "if" => return Ok(UnlinkedToken::Linkable(LinkableTokenType::If, c)),
            "marine" => return Ok(UnlinkedToken::Linkable(LinkableTokenType::Marine, c)),
            "sub" => return Ok(UnlinkedToken::Linkable(LinkableTokenType::Sub, c)),
            "wend" => return Ok(UnlinkedToken::Linkable(LinkableTokenType::Wend, c)),
            "while" => return Ok(UnlinkedToken::Linkable(LinkableTokenType::While, c)),
            _ => {}
        };

        if let Ok(v) = v.parse::<i64>() {
            return Ok(UnlinkedToken::Atomic(AtomicToken::PushInteger(v), c));
        }
        if let Ok(v) = match v.get(..2) {
            Some("0x") => i64::from_str_radix(&v[2..], 16),
            Some("0o") => i64::from_str_radix(&v[2..], 8),
            Some("0b") => i64::from_str_radix(&v[2..], 2),
            _ => v.parse::<i64>(),
        } {
            return Ok(UnlinkedToken::Atomic(AtomicToken::PushInteger(v), c));
        }
        if let Some(v) = v.strip_prefix('"').and_then(|s| s.strip_suffix('"')) {
            return Ok(UnlinkedToken::Linkable(
                LinkableTokenType::PushStaticStringPtr(v.to_string()),
                c,
            ));
        }

        let mut chars = v.bytes();
        let starts_with_char = matches!(chars.next(), Some(b'a'..=b'z' | b'A'..=b'Z' | b'_'));
        let is_ascii_alpha = chars.all(|c| c.is_ascii_alphanumeric() || c == b'_');
        let is_not_just_underscore = v != "_";
        if starts_with_char && is_ascii_alpha && is_not_just_underscore {
            return Ok(UnlinkedToken::Atomic(
                AtomicToken::CallSub(v.to_string()),
                c,
            ));
        }

        Err(TokenParseError::UnknownToken(v.to_string()))
    }
}

#[cfg(test)]
mod tests {
    use crate::resolver::FileId;

    use super::*;

    static CTX: TokenContext = TokenContext {
        line: 0,
        column: 0,
        file: FileId(0),
    };

    #[test]
    fn fails_on_unknown_token() {
        assert!(matches!(
            // 123abc is an illegal sub name since its starts with a number
            UnlinkedToken::try_from_source("123abc", CTX),
            Err(TokenParseError::UnknownToken(v)) if v == "123abc"
        ));
    }
}
