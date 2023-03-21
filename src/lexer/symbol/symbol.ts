import { Instruction } from "../../instruction";
import { LineBuffer } from "../line_buffer";
import { UnknownInstructionError } from "../unknown_instruction_error";
import { BuiltinSymbolResolver } from "./builtin_resolver";
import { IntegerLiteralSymbolResolver } from "./int_literal_resolver";
import { SymbolResolver } from "./resolver";

export class Symbol {
    protected string_representation: string;
    protected readonly symbol_resolvers: SymbolResolver[] = [
        new BuiltinSymbolResolver(),
        new IntegerLiteralSymbolResolver(),
    ];

    public constructor(buffer: LineBuffer) {
        this.string_representation = buffer.toString();
    }

    public as_instruction(): Instruction {
        for (const symbol_resolver of this.symbol_resolvers) {
            const instruction = symbol_resolver.resolve(this);
            if (instruction) {
                return instruction;
            }
        }
        throw new UnknownInstructionError(this.string_representation);
    }

    public toString(): string {
        return this.string_representation;
    }
}
