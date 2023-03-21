import fs from "node:fs";

import { BinaryRuntime } from "../../binary_runtime";
import { Logger } from "../../logger";
import { Compiler } from "../compiler";
import { CompilationResult } from "../result";

export class NasmCompiler implements Compiler<string, string, string> {
    // eslint-disable-next-line complexity
    public compile(asm_source: string): CompilationResult<string, string> {
        const binary_file = new BinaryRuntime("mktemp", []).run().stdout;
        const asm_file = `${binary_file}.asm`;
        const object_file = `${binary_file}.o`;
        Logger.debug(`${binary_file} ${asm_file} ${object_file}`);
        fs.writeFileSync(asm_file, asm_source);
        const nasm_result = new BinaryRuntime("nasm", ["-felf64", asm_file]).run();
        if (nasm_result.exit_code !== "0") {
            throw new Error(`${this.constructor.name}: ${nasm_result.stderr}`);
        }
        const linker_result = new BinaryRuntime("ld", ["-o", binary_file, object_file]).run();
        if (linker_result.exit_code !== "0") {
            throw new Error(`${this.constructor.name}: ${linker_result.stderr}`);
        }
        const chmod_result = new BinaryRuntime("chmod", ["u+x", binary_file]).run();
        if (chmod_result.exit_code !== "0") {
            throw new Error(`${this.constructor.name}: ${chmod_result.stderr}`);
        }

        return {
            source: asm_file,
            output: binary_file,
        };
    }
}
