#[derive(Debug)]
pub enum LexerOrigin {
    StdIn,
    File(String),
}

impl std::fmt::Display for LexerOrigin {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        let label = match self {
            Self::StdIn => "<stdin>",
            Self::File(path) => path.as_str(),
        };

        if f.alternate() {
            write!(f, "\x1b[1;34m{label}\x1b[0m")
        } else {
            f.write_str(label)
        }
    }
}
