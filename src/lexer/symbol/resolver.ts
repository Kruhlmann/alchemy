import { Instruction } from "../../instruction";
import { Symbol } from "./symbol";

export interface SymbolResolver {
    resolve(symbol: Symbol): Instruction | undefined;
}
