import { Instruction } from "../instruction";
import { Lexer } from "./lexer";
import { LineBuffer } from "./line_buffer";
import { NewlineEscapedString } from "./newline_escaped_string";
import { TasmSource } from "./source";
import { Symbol } from "./symbol";

export interface CharacterLexerAction {
    char_ptr: number;
    signal: CharacterLexerSignal;
}

export enum CharacterLexerSignal {
    Continue,
    Break,
}

// eslint-disable-next-line quotes
const DOUBLE_QUOTE = `"`;

export class TasmLexer implements Lexer<TasmSource, Instruction[]> {
    // eslint-disable-next-line complexity
    protected lex_next_character(
        char_ptr: number,
        line: String,
        buffer: LineBuffer,
        symbols: Symbol[],
    ): CharacterLexerAction {
        if (buffer.empty() && line[char_ptr].trim().length === 0) {
            char_ptr++;
            return {
                char_ptr,
                signal: CharacterLexerSignal.Continue,
            };
        }

        if (line[char_ptr] === DOUBLE_QUOTE) {
            buffer.push(DOUBLE_QUOTE);
            char_ptr++;
            while (char_ptr < line.length) {
                if (line[char_ptr] === DOUBLE_QUOTE) {
                    buffer.push(DOUBLE_QUOTE);
                    char_ptr++;
                    break;
                }
                buffer.push(line[char_ptr]);
                char_ptr++;
            }

            symbols.push(new Symbol(buffer));
            buffer.reset();
            return { char_ptr, signal: CharacterLexerSignal.Continue };
        }

        buffer.push(line[char_ptr]);
        char_ptr++;

        if (char_ptr >= line.length) {
            symbols.push(new Symbol(buffer));
            buffer.reset();
            return { char_ptr, signal: CharacterLexerSignal.Break };
        }

        if (char_ptr >= line.length) {
            symbols.push(new Symbol(buffer));
            buffer.reset();
            return { char_ptr, signal: CharacterLexerSignal.Break };
        }

        if (line[char_ptr].trim().length === 0) {
            symbols.push(new Symbol(buffer));
            buffer.reset();
        } else {
            buffer.push(line[char_ptr]);
        }

        char_ptr += 1;
        return {
            char_ptr,
            signal: char_ptr < line.length ? CharacterLexerSignal.Continue : CharacterLexerSignal.Break,
        };
    }

    // eslint-disable-next-line complexity
    protected lex_line(line: string, _line_number: number, _context: string): Instruction[] {
        let char_ptr = 0;
        const buffer = new LineBuffer();
        const symbols: Symbol[] = [];
        const escaped_line = new NewlineEscapedString(line);
        let action: CharacterLexerAction;

        while ((action = this.lex_next_character(char_ptr, escaped_line, buffer, symbols))) {
            char_ptr = action.char_ptr;
            if (action.signal === CharacterLexerSignal.Break) {
                break;
            }
        }

        if (buffer.toString().length > 0) {
            symbols.push(new Symbol(buffer));
        }

        return symbols.map((symbol) => symbol.as_instruction());
    }

    public lex(source: TasmSource): Instruction[] {
        return source.text.split("\n").flatMap((line, line_number) => this.lex_line(line, line_number, source.context));
    }
}
