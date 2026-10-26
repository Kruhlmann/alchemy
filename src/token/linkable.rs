#[derive(Debug, Clone)]
pub enum LinkableTokenType {
    Sub,
    Marine,
    If,
    Else,
    EndIf,
    While,
    Do,
    Wend,
    PushStaticStringPtr(String),
}
