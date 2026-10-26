pub mod block;
pub mod error;
pub mod stack;

pub use block::*;
pub use error::*;
pub use stack::*;

use crate::token::{AtomicToken, LinkableTokenType, Token, UnlinkedToken};

pub struct Linker;

impl Linker {
    pub fn link_tokens(tokens: Vec<UnlinkedToken>) -> Result<Vec<Token>, LinkerError> {
        Linker::link_tokens_or_err(tokens)
    }

    fn link_tokens_or_err(tokens: Vec<UnlinkedToken>) -> Result<Vec<Token>, LinkerError> {
        let mut linked_tokens: Vec<Token> = Vec::with_capacity(tokens.len());
        let mut reference_stack = LinkerStack::new();
        let mut found_main = false;
        for (index, token) in tokens.iter().enumerate() {
            match token.clone() {
                UnlinkedToken::Atomic(AtomicToken::CallSub(v), context) => {
                    if let Some(UnlinkedToken::Linkable(LinkableTokenType::Sub, ..)) =
                        tokens.get(index - 1)
                    {
                        found_main |= v == "main";
                        linked_tokens.push(Token::Atomic(AtomicToken::SubDefinition(v), context));
                    } else {
                        linked_tokens.push(Token::Atomic(AtomicToken::CallSub(v), context));
                    }
                }
                // Atomic catch-all
                UnlinkedToken::Atomic(token, context) => {
                    linked_tokens.push(Token::Atomic(token, context));
                }
                UnlinkedToken::Linkable(LinkableTokenType::If, context) => {
                    reference_stack.push(OpenBlock::If { index, context });
                    linked_tokens.push(Token::Atomic(AtomicToken::If, context));
                }
                UnlinkedToken::Linkable(LinkableTokenType::While, context) => {
                    reference_stack.push(OpenBlock::While { index, context });
                    linked_tokens.push(Token::Atomic(AtomicToken::While, context));
                }
                UnlinkedToken::Linkable(LinkableTokenType::Sub, context) => {
                    reference_stack.push(OpenBlock::Sub {
                        definition_index: index + 1,
                        context,
                    });
                    linked_tokens.push(Token::Atomic(AtomicToken::Sub, context));
                }
                UnlinkedToken::Linkable(LinkableTokenType::Do, context) => {
                    reference_stack.push(OpenBlock::Do { index, context });
                    linked_tokens.push(Token::Atomic(AtomicToken::Do, context));
                }
                UnlinkedToken::Linkable(LinkableTokenType::Wend, context) => {
                    match reference_stack.pop(LinkableTokenType::Wend, context)? {
                        OpenBlock::Do {
                            index: do_index,
                            context: do_context,
                        } => match reference_stack.pop(LinkableTokenType::Wend, context)? {
                            OpenBlock::While {
                                index: while_index,
                                context: while_context,
                            } => {
                                linked_tokens[do_index] =
                                    Token::linked(LinkableTokenType::Do, index, do_context);
                                linked_tokens[while_index] = Token::linked(
                                    LinkableTokenType::While,
                                    while_index,
                                    while_context,
                                );
                                linked_tokens.push(Token::doubly_linked(
                                    LinkableTokenType::Else,
                                    while_index,
                                    index,
                                    context,
                                ));
                            }
                            actual => {
                                return Err(LinkerError::MissingBlock {
                                    blocks: vec![LinkableTokenType::While],
                                    trigger: LinkableTokenType::Wend,
                                    actual: actual.link_type(),
                                    context,
                                });
                            }
                        },
                        actual => {
                            return Err(LinkerError::MissingBlock {
                                blocks: vec![LinkableTokenType::Do],
                                trigger: LinkableTokenType::Wend,
                                actual: actual.link_type(),
                                context,
                            });
                        }
                    }
                }
                UnlinkedToken::Linkable(LinkableTokenType::Else, context) => {
                    match reference_stack.pop(LinkableTokenType::Else, context)? {
                        OpenBlock::If {
                            index: if_index,
                            context: if_context,
                        } => {
                            linked_tokens[if_index] =
                                Token::linked(LinkableTokenType::If, index, if_context);

                            linked_tokens.push(Token::linked(
                                LinkableTokenType::Else,
                                index,
                                context,
                            ));

                            reference_stack.push(OpenBlock::Else { index, context });
                        }
                        actual => {
                            return Err(LinkerError::MissingBlock {
                                blocks: vec![LinkableTokenType::If],
                                trigger: LinkableTokenType::Else,
                                actual: actual.link_type(),
                                context,
                            });
                        }
                    }
                }
                UnlinkedToken::Linkable(LinkableTokenType::EndIf, context) => {
                    match reference_stack.pop(LinkableTokenType::EndIf, context)? {
                        OpenBlock::If {
                            index: if_index,
                            context: if_context,
                        } => {
                            linked_tokens[if_index] =
                                Token::linked(LinkableTokenType::If, index, if_context);
                        }

                        OpenBlock::Else {
                            index: else_index,
                            context: else_context,
                        } => {
                            linked_tokens[else_index] = Token::doubly_linked(
                                LinkableTokenType::Else,
                                index,
                                else_index,
                                else_context,
                            );
                        }

                        actual => {
                            return Err(LinkerError::MissingBlock {
                                blocks: vec![LinkableTokenType::If, LinkableTokenType::Else],
                                trigger: LinkableTokenType::EndIf,
                                actual: actual.link_type(),
                                context,
                            });
                        }
                    }

                    linked_tokens.push(Token::linked(LinkableTokenType::EndIf, index, context));
                }
                UnlinkedToken::Linkable(LinkableTokenType::Marine, context) => {
                    match reference_stack.pop(LinkableTokenType::Marine, context)? {
                        OpenBlock::Sub {
                            definition_index, ..
                        } => {
                            linked_tokens.push(Token::linked(
                                LinkableTokenType::Marine,
                                definition_index,
                                context,
                            ));
                        }

                        actual => {
                            return Err(LinkerError::UnexpectedToken {
                                expected: LinkableTokenType::Sub,
                                actual: actual.link_type(),
                                context,
                            });
                        }
                    }
                }
                UnlinkedToken::Linkable(LinkableTokenType::PushStaticStringPtr(v), context) => {
                    linked_tokens.push(Token::Linked {
                        token: LinkableTokenType::PushStaticStringPtr(v),
                        link: index,
                        context,
                    });
                }
            };
        }

        if !found_main {
            return Err(LinkerError::NoMainSub);
        }

        if !reference_stack.is_empty() {
            return Err(LinkerError::ReferenceStackNotEmpty(reference_stack));
        }

        Ok(linked_tokens)
    }
}

#[cfg(test)]
mod test {
    use crate::token::TokenContext;

    use super::*;

    static CTX: TokenContext = TokenContext { line: 0, column: 0 };

    #[test]
    fn fails_to_link_without_main_sub() {
        assert!(matches!(
            Linker::link_tokens(vec![]),
            Err(LinkerError::NoMainSub)
        ));
    }

    #[test]
    fn fails_when_reference_stack_left_nonempty() {
        assert!(matches!(
            Linker::link_tokens(vec![
                UnlinkedToken::Linkable(LinkableTokenType::Sub, CTX),
                UnlinkedToken::Atomic(AtomicToken::CallSub("main".to_string()), CTX),
                UnlinkedToken::Linkable(LinkableTokenType::Marine, CTX),
                UnlinkedToken::Linkable(LinkableTokenType::If, CTX),
            ]),
            Err(LinkerError::ReferenceStackNotEmpty(..))
        ));
    }

    #[test]
    fn fails_on_unmatched() {
        assert!(matches!(
            Linker::link_tokens(vec![
                UnlinkedToken::Linkable(LinkableTokenType::Sub, CTX),
                UnlinkedToken::Atomic(AtomicToken::CallSub("main".to_string()), CTX),
                UnlinkedToken::Linkable(LinkableTokenType::If, CTX),
                UnlinkedToken::Linkable(LinkableTokenType::Marine, CTX),
            ]),
            Err(LinkerError::UnexpectedToken {
                expected: LinkableTokenType::Sub,
                actual: LinkableTokenType::If,
                ..
            })
        ));
    }

    #[test]
    fn fails_on_missing_block() {
        assert!(matches!(
            Linker::link_tokens(vec![
                UnlinkedToken::Linkable(LinkableTokenType::Sub, CTX),
                UnlinkedToken::Atomic(AtomicToken::CallSub("main".to_string()), CTX),
                UnlinkedToken::Linkable(LinkableTokenType::Else, CTX),
            ]),
            Err(LinkerError::MissingBlock {
                trigger: LinkableTokenType::Else,
                actual: LinkableTokenType::Sub,
                ..
            })
        ));
    }

    #[test]
    fn fails_when_popping_empty_refstack() {
        assert!(matches!(
            Linker::link_tokens(vec![UnlinkedToken::Linkable(
                LinkableTokenType::Marine,
                CTX
            ),]),
            Err(LinkerError::EmptyReferenceStack { .. })
        ));
    }
}
