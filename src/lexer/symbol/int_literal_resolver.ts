import { Instruction, PushIntInstruction } from "../../instruction";
import { SymbolResolver } from "./resolver";
import { Symbol } from "./symbol";

export class IntegerLiteralSymbolResolver implements SymbolResolver {
    public resolve(symbol: Symbol): Instruction | undefined {
        try {
            const parsed = BigInt(symbol.toString());
            return new PushIntInstruction(parsed);
            // eslint-disable-next-line no-empty
        } catch {}
    }
}
