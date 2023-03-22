import { Instruction, LiteralInstruction } from "../../instruction";
import { SymbolResolver } from "./resolver";
import { Symbol } from "./symbol";

export class LiteralSymbolResolver implements SymbolResolver {
    public resolve(symbol: Symbol): Instruction | undefined {
        return new LiteralInstruction(symbol.toString());
    }
}
