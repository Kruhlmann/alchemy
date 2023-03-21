import { TasmInstruction } from "../instruction";

export interface TasmCompiler<BinaryType> {
    compile(instructions: Array<TasmInstruction>): BinaryType;
}
