import { Instruction, PushIntInstruction } from "../instruction";
import { Lexer } from "./lexer";
import { LineBuffer } from "./line_buffer";
import { InstructionLookupTable } from "./lookup_table";
import { TasmSource } from "./source";
import { UnknownInstructionError } from "./unknown_instruction_error";

export class TasmLexer implements Lexer<TasmSource, Instruction[]> {
    protected instruction_from_symbol(symbol: string, _: unknown, __: unknown): Instruction {
        const builtin_instruction = InstructionLookupTable.lookup(symbol);
        if (builtin_instruction) {
            return builtin_instruction;
        }
        if (Number.parseInt(symbol, 10).toString() === symbol) {
            return new PushIntInstruction(Number.parseInt(symbol, 10));
        }
        // if (symbol_buffer.startsWith('"') && symbol_buffer.endsWith('"')) {

        // }
        throw new UnknownInstructionError(symbol);
    }

    // eslint-disable-next-line complexity
    protected lex_line(line: string, line_number: number, context: string): Instruction[] {
        let char_ptr = 0;
        const program: Instruction[] = [];
        const buffer = new LineBuffer();
        const buffers: LineBuffer[] = [];

        line = line.trim().replace("\\n", "\n");

        while (char_ptr < line.length) {
            if (buffer.empty()) {
                if (line[char_ptr].trim().length === 0) {
                    char_ptr += 1;
                    continue;
                }
                buffer.set_col(char_ptr);

                if (line[char_ptr] === "\"") {
                    buffer.push("\"");
                    char_ptr += 1;
                    while (char_ptr < line.length) {
                        if (line[char_ptr] === '"') {
                            buffer.push("\"");
                            char_ptr += 1;
                            break;
                        }
                        buffer.push(line[char_ptr]);
                        char_ptr += 1;
                    }

                    buffers.push(buffer.dup());
                    buffer.reset();
                    continue;
                }

                buffer.push(line[char_ptr]);
                char_ptr += 1;

                if (char_ptr >= line.length) {
                    buffers.push(buffer.dup());
                    buffer.reset();
                    break;
                }
            }

            if (char_ptr >= line.length) {
                buffers.push(buffer.dup());
                buffer.reset();
                break;
            }

            if (line[char_ptr].trim().length === 0) {
                buffers.push(buffer.dup());
                buffer.reset();
            } else {
                buffer.push(line[char_ptr]);
            }

            char_ptr += 1;
        }

        if (buffer.toString().length > 0) {
            buffers.push(buffer);
        }

        for (const symbol_buffer of buffers) {
            const instruction = this.instruction_from_symbol(symbol_buffer.toString(), context, line_number);
            program.push(instruction);
        }

        return program;
    }

    public lex(source: TasmSource): Instruction[] {
        return source.text.split("\n").flatMap((line, line_number) => this.lex_line(line, line_number, source.context));
    }
}
