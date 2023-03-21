import fs from "node:fs";

import { BinaryRuntime } from "../../binary_runtime";
import { Logger } from "../../logger";
import { Compiler } from "../compiler";
import { CompilationResult } from "../result";

export class NasmCompiler implements Compiler<string, string, string> {
    public compile(asm_source: string): CompilationResult<string, string> {
        const binary_file = new BinaryRuntime("mktemp", []).run().stdout;
        const asm_file = `${binary_file}.asm`;
        const object_file = `${binary_file}.o`;
        Logger.debug(`${binary_file} ${asm_file} ${object_file}`);
        fs.writeFileSync(asm_file, asm_source);
        new BinaryRuntime("nasm", ["-felf64", asm_file]).run();
        new BinaryRuntime("ld", ["-o", binary_file, object_file]).run();
        new BinaryRuntime("chmod", ["u+x", binary_file]).run();

        return {
            source: asm_file,
            output: binary_file,
        };
    }
}
