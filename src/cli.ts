import fs from "node:fs";

import { Amd64AlchemyCompiler, NasmCompiler } from "./compiler";
import { CrossReferencer } from "./cross_referencer";
import { IncludePreprocessor } from "./include";
import { AlchemyLexer } from "./lexer";
import { Logger } from "./logger";

export class AlchemyCompilerCli {
    public compile(source_file: string | undefined, output_file: string) {
        Logger.silent = false;
        if (source_file === undefined || output_file === undefined) {
            return this.usage();
        }
        const raw_source = fs.readFileSync(source_file).toString();
        const source = new IncludePreprocessor([process.cwd()]).resolve_includes(raw_source);
        const lexer = new AlchemyLexer();
        const cross_referencer = new CrossReferencer();
        const alchemy_compiler = new Amd64AlchemyCompiler(lexer, cross_referencer);
        const nasm_compiler = new NasmCompiler();
        const compilation_result = alchemy_compiler.compile({
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
        Logger.info("Usage: alchemyc <alchemy_file> <binary_file>");
    }
}
