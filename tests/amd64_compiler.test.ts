import { BinaryRuntime } from "../src";
import { Amd64TasmCompiler, NasmCompiler } from "../src/compiler";
import { CrossReferencer } from "../src/cross_referencer";
import { TasmLexer, TasmReferenceModel } from "../src/lexer";
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

        const binary_compilation_result = nasm_compiler.compile(compilation_result.output);
        const exection_result = new BinaryRuntime(binary_compilation_result.output, []).run();

        expect(exection_result.exit_code).toBe(program.exit_code);
        expect(exection_result.stdout).toBe(program.stdout);
    });
});
