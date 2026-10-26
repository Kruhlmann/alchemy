pub mod error;
pub mod origin;

pub use error::*;
pub use origin::*;

use crate::{
    resolver::ResolvedSourceCode,
    token::{TokenContext, UnlinkedToken},
};

pub struct Lexer;

impl Lexer {
    pub fn lex_source_code_stdin(
        source_code: &ResolvedSourceCode,
    ) -> Result<Vec<UnlinkedToken>, LexerError> {
        Self::lex(source_code, LexerOrigin::StdIn)
    }

    pub fn lex_source_code_file(
        source_code: &ResolvedSourceCode,
        file: &str,
    ) -> Result<Vec<UnlinkedToken>, LexerError> {
        Self::lex(source_code, LexerOrigin::File(file.to_string()))
    }

    fn lex(
        source_code: &ResolvedSourceCode,
        source_origin: LexerOrigin,
    ) -> Result<Vec<UnlinkedToken>, LexerError> {
        let mut tokens = Vec::new();

        for (line_index, line) in source_code.0.split('\n').enumerate() {
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
                    line: line_index + 1,
                    column: word.as_ptr() as usize - line.as_ptr() as usize,
                };

                let token = match UnlinkedToken::try_from_source(word, context) {
                    Ok(token) => token,
                    Err(error) => {
                        return Err(LexerError {
                            error,
                            context,
                            origin: source_origin,
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
