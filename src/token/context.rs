#[derive(Debug, Clone, Copy)]
pub struct TokenContext<'a> {
    pub line: usize,
    pub column: usize,
    pub file: &'a str,
}
