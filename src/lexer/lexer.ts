export interface Lexer<SourceType, OutputType> {
    lex(source: SourceType): OutputType;
}
