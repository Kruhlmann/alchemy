import fs from "node:fs";

import { Amd64TasmCompiler, NasmCompiler } from "./compiler";
import { CrossReferencer } from "./cross_referencer";
import { TasmLexer } from "./lexer";

export class TasmCompilerCli {
    public compile(file_path: string) {
        const source = fs.readFileSync(file_path).toString();
        const lexer = new TasmLexer();
        const cross_referencer = new CrossReferencer();
        const tasm_compiler = new Amd64TasmCompiler(lexer, cross_referencer);
        const nasm_compiler = new NasmCompiler();
        const compilation_result = tasm_compiler.compile({
            text: source,
            context: file_path,
        });
        const nasm_result = nasm_compiler.compile(compilation_result.output);
        console.log(`Compiled to file ${nasm_result.output}`);
    }
}
