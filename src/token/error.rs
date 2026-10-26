#[derive(Debug)]
pub enum TokenParseError {
    UnknownToken(String),
}

impl std::fmt::Display for TokenParseError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Self::UnknownToken(token) => write!(f, "unrecognized token {token:?}"),
        }
    }
}

impl std::error::Error for TokenParseError {}
