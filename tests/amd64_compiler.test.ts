import fs from "node:fs";

import {
    Amd64AlchemyCompiler,
    BinaryRuntime,
    CrossReferencer,
    IncludePreprocessor,
    NasmCompiler,
    AlchemyLexer,
    AlchemyReferenceModel,
} from "../src";
import { AlchemyTestProgram } from "./utils";

const test_cases = [
    "arithmetic",
    "stdout",
    "bitwise",
    "conditional",
    "while",
    "memory",
    "syscall",
    "turing",
    "stack",
    "include",
];

describe("Amd64Compiler", () => {
    test.each(test_cases)("compiles and executes program %p", (program_name: string) => {
        const program = new AlchemyTestProgram(program_name);
        const include_preprocessor = new IncludePreprocessor([process.cwd()]);
        program.set_source(include_preprocessor.resolve_includes(program.alchemy_source_code));
        const lexer = new AlchemyLexer();
        const cross_referencer = new CrossReferencer();
        const alchemy_compiler = new Amd64AlchemyCompiler(lexer, cross_referencer);
        const nasm_compiler = new NasmCompiler();
        const compilation_result = alchemy_compiler.compile(program.alchemy_source);
        const refmodel = new AlchemyReferenceModel(compilation_result.source);

        expect(refmodel.toString()).toBe(program.refmodel_code);

        const temporary_path = new BinaryRuntime("mktemp", []).run().stdout;
        const binary_compilation_result = nasm_compiler.compile({
            asm_source: compilation_result.output,
            output_file: temporary_path,
        });
        const exection_result = new BinaryRuntime(binary_compilation_result.output, []).run();

        fs.unlinkSync(binary_compilation_result.output);

        expect(exection_result.exit_code).toBe(program.exit_code);
        expect(exection_result.stdout).toBe(program.stdout);
    });
});
