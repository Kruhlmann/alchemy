import fs from "node:fs";

import { Amd64TasmCompiler, BinaryRuntime, CrossReferencer, NasmCompiler, TasmLexer, TasmReferenceModel } from "../src";
import { TasmTestProgram } from "./utils";

const test_cases = ["arithmetic", "stdout", "bitwise", "conditional"];

describe("Amd64Compiler", () => {
    test.each(test_cases)("compiles and executes program %p", (program_name: string) => {
        const program = new TasmTestProgram(program_name);
        const lexer = new TasmLexer();
        const cross_referencer = new CrossReferencer();
        const tasm_compiler = new Amd64TasmCompiler(lexer, cross_referencer);
        const nasm_compiler = new NasmCompiler();
        const compilation_result = tasm_compiler.compile(program.tasm_source);
        const refmodel = new TasmReferenceModel(compilation_result.source);

        expect(refmodel.toString()).toBe(program.refmodel_code);

        const temporary_path = new BinaryRuntime("mktemp", []).run().stdout;
        const binary_compilation_result = nasm_compiler.compile({
            asm_source: compilation_result.output,
            output_file: temporary_path,
        });
        const exection_result = new BinaryRuntime(binary_compilation_result.output, []).run();

        fs.unlinkSync(binary_compilation_result.output);
        fs.unlinkSync(temporary_path);

        expect(exection_result.exit_code).toBe(program.exit_code);
        expect(exection_result.stdout).toBe(program.stdout);
    });
});
