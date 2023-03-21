import { Instruction, PushStringInstruction } from "../../instruction";
import { SymbolResolver } from "./resolver";
import { Symbol } from "./symbol";

export class StringLiteralSymbolResolver implements SymbolResolver {
    public resolve(symbol: Symbol): Instruction | undefined {
        // eslint-disable-next-line quotes
        if (symbol.toString().startsWith(`"`) && symbol.toString().endsWith(`"`)) {
            return new PushStringInstruction(symbol.toString().slice(1, -1));
        }
    }
}
