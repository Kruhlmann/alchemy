import fs from "node:fs";

import { BinaryRuntime } from "../../binary_runtime";
import { Logger } from "../../logger";
import { Compiler } from "../compiler";
import { CompilationResult } from "../result";

export interface NasmCompilerParameters {
    asm_source: string;
    output_file: string;
}

export class NasmCompiler implements Compiler<NasmCompilerParameters, string, string> {
    // eslint-disable-next-line complexity
    public compile(parameters: NasmCompilerParameters): CompilationResult<string, string> {
        const asm_file = `${parameters.output_file}.asm`;
        const object_file = `${parameters.output_file}.o`;
        Logger.debug(`Writing NASM-style assembly to ${asm_file}`);
        fs.writeFileSync(asm_file, parameters.asm_source);
        const nasm_result = new BinaryRuntime("nasm", ["-felf64", "-g", "-F", "dwarf", asm_file]).run();
        if (nasm_result.exit_code !== "0") {
            throw new Error(`${this.constructor.name}: ${nasm_result.stderr}`);
        }
        const linker_result = new BinaryRuntime("ld", ["-o", parameters.output_file, object_file]).run();
        if (linker_result.exit_code !== "0") {
            throw new Error(`${this.constructor.name}: ${linker_result.stderr}`);
        }
        const chmod_result = new BinaryRuntime("chmod", ["u+x", parameters.output_file]).run();
        if (chmod_result.exit_code !== "0") {
            throw new Error(`${this.constructor.name}: ${chmod_result.stderr}`);
        }

        Logger.debug(`Unlink ${asm_file}`);
        //fs.unlinkSync(asm_file);
        Logger.debug(`Unlink ${object_file}`);
        fs.unlinkSync(object_file);

        return {
            source: asm_file,
            output: parameters.output_file,
        };
    }
}
