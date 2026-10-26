use crate::token::{LinkableTokenType, TokenContext};

#[derive(Debug, Clone)]
pub enum OpenBlock {
    Sub {
        definition_index: usize,
        context: TokenContext,
    },
    If {
        index: usize,
        context: TokenContext,
    },
    While {
        index: usize,
        context: TokenContext,
    },
    Do {
        index: usize,
        context: TokenContext,
    },
    Else {
        index: usize,
        context: TokenContext,
    },
}

impl OpenBlock {
    pub fn link_type(&self) -> LinkableTokenType {
        match self {
            Self::Sub { .. } => LinkableTokenType::Sub,
            Self::If { .. } => LinkableTokenType::If,
            Self::While { .. } => LinkableTokenType::While,
            Self::Do { .. } => LinkableTokenType::Do,
            Self::Else { .. } => LinkableTokenType::Else,
        }
    }
}
