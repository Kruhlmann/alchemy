use crate::{
    linker::{LinkerError, OpenBlock},
    token::{LinkableTokenType, TokenContext},
};

#[derive(Debug, Clone, Default)]
pub struct LinkerStack(Vec<OpenBlock>);

impl LinkerStack {
    pub fn new() -> Self {
        Self::default()
    }

    pub fn pop(
        &mut self,
        token_to_link: LinkableTokenType,
        context: TokenContext,
    ) -> Result<OpenBlock, LinkerError> {
        self.0.pop().ok_or(LinkerError::EmptyReferenceStack {
            token_to_link,
            context,
        })
    }

    pub fn push(&mut self, item: OpenBlock) {
        self.0.push(item);
    }

    pub fn is_empty(&self) -> bool {
        self.0.is_empty()
    }
}

impl<'a> IntoIterator for &'a LinkerStack {
    type Item = &'a OpenBlock;
    type IntoIter = std::slice::Iter<'a, OpenBlock>;

    fn into_iter(self) -> Self::IntoIter {
        self.0.iter()
    }
}
