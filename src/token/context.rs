use crate::resolver::FileId;

#[derive(Debug, Clone, Copy)]
pub struct TokenContext {
    pub line: usize,
    pub column: usize,
    pub file: FileId,
}
