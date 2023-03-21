import { Instruction, PushIntInstruction } from "../../instruction";
import { SymbolResolver } from "./resolver";
import { Symbol } from "./symbol";

export class IntegerLiteralSymbolResolver implements SymbolResolver {
    public resolve(symbol: Symbol): Instruction | undefined {
        const parsed = Number.parseInt(symbol.toString(), 10);
        if (Number.isInteger(parsed)) {
            return new PushIntInstruction(parsed);
        }
    }
}
