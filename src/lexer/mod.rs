pub mod error;

pub use error::*;

use crate::{
    resolver::ResolvedSourceCode,
    token::{TokenContext, UnlinkedToken},
};

pub struct Lexer;

impl Lexer {
    pub fn lex(source_code: &ResolvedSourceCode) -> Result<Vec<UnlinkedToken>, LexerError> {
        let mut tokens = Vec::new();
        for source_line in &source_code.lines {
            let line = source_line.text.trim_end_matches('\n');

            let mut in_quotes = false;
            let mut escaped = false;

            let words = line
                .split(|ch: char| {
                    if escaped {
                        escaped = false;
                        return false;
                    }
                    if in_quotes && ch == '\\' {
                        escaped = true;
                        return false;
                    }
                    if ch == '"' {
                        in_quotes = !in_quotes;
                    }

                    !in_quotes && ch.is_whitespace()
                })
                .filter(|word| !word.is_empty());

            for word in words {
                let context = TokenContext {
                    file: source_line.file,
                    line: source_line.line,
                    column: word.as_ptr() as usize - line.as_ptr() as usize,
                };
                let token = match UnlinkedToken::try_from_source(word, context) {
                    Ok(token) => token,
                    Err(error) => {
                        return Err(LexerError {
                            error,
                            context,
                            file: source_code.files.path(context.file).to_path_buf(),
                            source_line: line.to_owned(),
                        });
                    }
                };

                tokens.push(token);
            }
        }

        Ok(tokens)
    }
}
