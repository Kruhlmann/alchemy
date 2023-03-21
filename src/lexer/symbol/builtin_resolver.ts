import { Instruction } from "../../instruction";
import { InstructionLookupTable } from "../lookup_table";
import { SymbolResolver } from "./resolver";
import { Symbol } from "./symbol";

export class BuiltinSymbolResolver implements SymbolResolver {
    public resolve(symbol: Symbol): Instruction | undefined {
        const builtin_instruction = InstructionLookupTable.lookup(symbol.toString());
        if (builtin_instruction) {
            return builtin_instruction;
        }
    }
}
