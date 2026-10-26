use std::path::PathBuf;

use crate::token::{TokenContext, TokenParseError};

#[derive(Debug)]
pub struct LexerError {
    pub error: TokenParseError,
    pub file: PathBuf,
    pub context: TokenContext,
    pub source_line: String,
}

impl std::error::Error for LexerError {}

impl std::fmt::Display for LexerError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        let (red, blue, reset) = if f.alternate() {
            ("\x1b[1;31m", "\x1b[1;34m", "\x1b[0m")
        } else {
            ("", "", "")
        };
        let source = self.source_line.replace('\t', "    ");
        let prefix = &self.source_line[..self.context.column];
        let padding: usize = prefix
            .chars()
            .map(|ch| if ch == '\t' { 4 } else { 1 })
            .sum();
        let column = prefix.chars().count() + 1;
        let width = self.context.line.to_string().len();

        writeln!(f, "{red}error{reset}: {}", self.error)?;
        writeln!(
            f,
            "{:width$}{blue}-->{reset} {}:{}:{}",
            "",
            self.file.display(),
            self.context.line,
            column,
        )?;
        writeln!(f, "{:width$} {blue}|{reset}", "")?;
        writeln!(f, "{blue}{:>width$} |{reset} {}", self.context.line, source,)?;
        write!(
            f,
            "{:width$} {blue}|{reset} {:padding$}{red}^{reset}",
            "", "",
        )
    }
}
