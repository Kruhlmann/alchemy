import { TasmInstruction } from "../instruction";
import { TasmCompiler } from "./compiler";

export class Amd64Compiler implements TasmCompiler<string> {
    public compile(instructions: TasmInstruction[]): string {
        console.log(instructions);
        return "";
    }
}
