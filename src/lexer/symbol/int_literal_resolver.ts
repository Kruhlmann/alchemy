import { Instruction, PushIntInstruction } from "../../instruction";
import { SymbolResolver } from "./resolver";
import { Symbol } from "./symbol";

export class IntegerLiteralSymbolResolver implements SymbolResolver {
    public resolve(symbol: Symbol): Instruction | undefined {
        if (Number.parseInt(symbol.toString(), 10).toString() === symbol.toString()) {
            return new PushIntInstruction(Number.parseInt(symbol.toString(), 10));
        }
    }
}
