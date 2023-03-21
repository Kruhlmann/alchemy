import { Instruction, PushIntInstruction } from "../instruction";
import { Lexer } from "./lexer";
import { LineBuffer } from "./line_buffer";
import { InstructionLookupTable } from "./lookup_table";
import { TasmSource } from "./source";
import { UnknownInstructionError } from "./unknown_instruction_error";

export class Symbol {
    protected string_representation: string;
    // protected readonly symbol_resolvers: SymbolResolver[];

    public constructor(buffer: LineBuffer) {
        this.string_representation = buffer.toString();
    }

    public as_instruction(): Instruction {
        // for (const symbol_resolver of this.symbol_resolvers) {
        //     const instruction = symbol_resolver.resolve(this);
        //     if (instruction) {
        //         return instruction;
        //     }
        // }
        const builtin_instruction = InstructionLookupTable.lookup(this.string_representation);
        if (builtin_instruction) {
            return builtin_instruction;
        }
        if (Number.parseInt(this.string_representation, 10).toString() === this.string_representation) {
            return new PushIntInstruction(Number.parseInt(this.string_representation, 10));
        }
        throw new UnknownInstructionError(this.string_representation);
    }

    public toString(): string {
        return this.string_representation;
    }
}

export class TasmLexer implements Lexer<TasmSource, Instruction[]> {
    // protected instruction_from_symbol(symbol: string, _: unknown, __: unknown): Instruction {
    //     const builtin_instruction = InstructionLookupTable.lookup(symbol);
    //     if (builtin_instruction) {
    //         return builtin_instruction;
    //     }
    //     if (Number.parseInt(symbol, 10).toString() === symbol) {
    //         return new PushIntInstruction(Number.parseInt(symbol, 10));
    //     }
    //     // if (symbol_buffer.startsWith('"') && symbol_buffer.endsWith('"')) {

    //     // }
    //     throw new UnknownInstructionError(symbol);
    // }

    // eslint-disable-next-line complexity
    protected lex_line(line: string, _line_number: number, _context: string): Instruction[] {
        let char_ptr = 0;
        const program: Instruction[] = [];
        const buffer = new LineBuffer();
        const symbols: Symbol[] = [];

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

        if (buffer.toString().length > 0) {
            symbols.push(new Symbol(buffer));
        }

        for (const symbol of symbols) {
            // const instruction = this.instruction_from_symbol(symbol.toString(), context, line_number);
            program.push(symbol.as_instruction());
        }

        return program;
    }

    public lex(source: TasmSource): Instruction[] {
        return source.text.split("\n").flatMap((line, line_number) => this.lex_line(line, line_number, source.context));
    }
}
