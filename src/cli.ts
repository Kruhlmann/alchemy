import fs from "node:fs";

import { Amd64TasmCompiler, NasmCompiler } from "./compiler";
import { CrossReferencer } from "./cross_referencer";
import { TasmLexer } from "./lexer";
import { Logger } from "./logger";

export class TasmCompilerCli {
    public compile(source_file: string | undefined, output_file: string) {
        Logger.silent = false;
        if (source_file === undefined || output_file === undefined) {
            return this.usage();
        }
        const source = fs.readFileSync(source_file).toString();
        const lexer = new TasmLexer();
        const cross_referencer = new CrossReferencer();
        const tasm_compiler = new Amd64TasmCompiler(lexer, cross_referencer);
        const nasm_compiler = new NasmCompiler();
        const compilation_result = tasm_compiler.compile({
            text: source,
            context: source_file,
        });
        const nasm_result = nasm_compiler.compile({
            asm_source: compilation_result.output,
            output_file,
        });
        Logger.info(`Compiled to file ${nasm_result.output}`);
    }

    protected usage(): void {
        Logger.info("Usage: tasmc <tasm_file> <binary_file>");
    }
}
