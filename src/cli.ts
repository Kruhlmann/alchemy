import fs from "node:fs";

import { Amd64AlchemyCompiler, NasmCompiler } from "./compiler";
import { CrossReferencer } from "./cross_referencer";
import { IncludePreprocessor } from "./include";
import { IncludeInstructionPruner } from "./include_pruner";
import { AlchemyLexer } from "./lexer";
import { Logger } from "./logger";

export class AlchemyCompilerCli {
    public compile(source_file?: string, output_file?: string) {
        if (!source_file || !output_file) {
            return this.usage();
        }
        const includes = [process.cwd(), "/usr/share/alchemy"];
        Logger.silent = false;
        Logger.debug(`Compiling ${source_file}`);
        const raw_source = fs.readFileSync(source_file).toString();
        Logger.debug(`Include directories: [${includes.join(",")}]`);
        const source = new IncludePreprocessor(includes).resolve_includes(raw_source);
        const lexer = new AlchemyLexer();
        const cross_referencer = new CrossReferencer();
        const pruner = new IncludeInstructionPruner();
        const alchemy_compiler = new Amd64AlchemyCompiler(lexer, pruner, cross_referencer);
        const compilation_result = alchemy_compiler.compile({ text: source, context: source_file });

        const nasm_compiler = new NasmCompiler();
        const nasm_result = nasm_compiler.compile({ asm_source: compilation_result.output, output_file });

        Logger.info(`Compiled to file ${nasm_result.output}`);
    }

    protected usage(): void {
        Logger.info("Usage: alchemyc <alchemy_file> <binary_file>");
    }
}
