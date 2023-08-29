import { Instruction } from "../instruction";
import { Lexer } from "./lexer";
import { LineBuffer } from "./line_buffer";
import { NewlineEscapedString } from "./newline_escaped_string";
import { Symbol } from "./symbol";
import { AlchemySource } from "./alchemy_source";

// eslint-disable-next-line quotes
const DOUBLE_QUOTE = `"`;

export class AlchemyLexer implements Lexer<AlchemySource, Instruction[]> {
    // eslint-disable-next-line complexity
    protected lex_line(unescaped_line: string, _line_number: number, _context: string): Instruction[] {
        let char_ptr = 0;
        const buffer = new LineBuffer();
        const symbols: Symbol[] = [];
        const line = new NewlineEscapedString(unescaped_line);

        while (char_ptr < line.length) {
            if (buffer.empty()) {
                if (line[char_ptr].trim().length === 0) {
                    char_ptr += 1;
                    continue;
                }
                buffer.set_col(char_ptr);

                if (line[char_ptr] === DOUBLE_QUOTE) {
                    buffer.push(DOUBLE_QUOTE);
                    char_ptr += 1;
                    while (char_ptr < line.length) {
                        if (line[char_ptr] === DOUBLE_QUOTE) {
                            buffer.push(DOUBLE_QUOTE);
                            char_ptr += 1;
                            break;
                        }
                        buffer.push(line[char_ptr]);
                        char_ptr += 1;
                    }

                    symbols.push(new Symbol(buffer));
                    buffer.reset();
                    continue;
                }

                buffer.push(line[char_ptr]);
                char_ptr += 1;

                if (char_ptr >= line.length) {
                    symbols.push(new Symbol(buffer));
                    buffer.reset();
                    break;
                }
            }

            if (char_ptr >= line.length) {
                symbols.push(new Symbol(buffer));
                buffer.reset();
                break;
            }

            if (line[char_ptr].trim().length === 0) {
                symbols.push(new Symbol(buffer));
                buffer.reset();
            } else {
                buffer.push(line[char_ptr]);
            }

            char_ptr += 1;
        }

        if (!buffer.empty()) {
            symbols.push(new Symbol(buffer));
        }

        return symbols.map((symbol) => symbol.as_instruction());
    }

    public lex(source: AlchemySource): Instruction[] {
        return source.text
            .replace(/\[.*?\]/g, '')
            .split("\n")
            .flatMap((line, line_number) => this.lex_line(line, line_number, source.context));
    }
}
