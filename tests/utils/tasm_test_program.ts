import fs from "node:fs";

import { TasmSource } from "../../src/lexer/source";

export class TasmTestProgram {
    public readonly tasm_source_code: string;
    public readonly asm_source_code: string;
    public readonly refmodel_code: string;
    public readonly tasm_source: TasmSource;
    public readonly stdout: string;
    public readonly exit_code: string;

    public constructor(public program_name: string) {
        this.tasm_source_code = fs.readFileSync(`./tests/tasm_programs/${program_name}/program.tasm`).toString();
        this.asm_source_code = fs.readFileSync(`./tests/tasm_programs/${program_name}/program.asm`).toString();
        this.refmodel_code = fs.readFileSync(`./tests/tasm_programs/${program_name}/program.refmodel`).toString();
        this.stdout = fs.readFileSync(`./tests/tasm_programs/${program_name}/program.stdout`).toString();
        this.exit_code = fs.readFileSync(`./tests/tasm_programs/${program_name}/program.exitcode`).toString();
        this.tasm_source = {
            text: this.tasm_source_code,
            context: `${program_name}.tasm`,
        };
    }
}
