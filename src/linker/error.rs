use crate::{
    linker::LinkerStack,
    token::{LinkableTokenType, TokenContext},
};

#[derive(Debug)]
pub enum LinkerError {
    NoMainSub,
    UnexpectedToken {
        expected: LinkableTokenType,
        actual: LinkableTokenType,
        context: TokenContext,
    },
    MissingBlock {
        blocks: Vec<LinkableTokenType>,
        trigger: LinkableTokenType,
        actual: LinkableTokenType,
        context: TokenContext,
    },
    EmptyReferenceStack {
        token_to_link: LinkableTokenType,
        context: TokenContext,
    },
    ReferenceStackNotEmpty(LinkerStack),
}

impl std::fmt::Display for LinkerError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            LinkerError::NoMainSub => write!(f, "program must contain a 'main' sub"),
            LinkerError::UnexpectedToken {
                expected,
                actual,
                context,
            } => {
                write!(
                    f,
                    "unexpected {actual:?} expected {expected:?}: {context:?}"
                )
            }
            LinkerError::MissingBlock {
                blocks,
                trigger,
                actual,
                context,
            } => {
                let options = blocks
                    .iter()
                    .map(|b| format!("{b:?}"))
                    .collect::<Vec<String>>()
                    .join(" or ");
                write!(
                    f,
                    "attempted to close <{options}> block using {trigger:?} but last reference was {actual:?}: {context:?}."
                )
            }
            LinkerError::EmptyReferenceStack {
                token_to_link,
                context,
            } => {
                write!(
                    f,
                    "reference stack empty while linking {token_to_link:?}: {context:?}"
                )
            }
            LinkerError::ReferenceStackNotEmpty(stack) => {
                writeln!(f, "reference stack not empty after linking")?;
                writeln!(f, ">> STACK BEGIN")?;
                for item in stack.into_iter() {
                    writeln!(f, "    {item:?}")?;
                }
                writeln!(f, ">> STACK END")
            }
        }
    }
}

impl std::error::Error for LinkerError {}
