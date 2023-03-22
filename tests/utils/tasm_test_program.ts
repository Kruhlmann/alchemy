import fs from "node:fs";

import { TasmSource } from "../../src/lexer";

export class TasmTestProgram {
    public tasm_source_code: string;
    public tasm_source: TasmSource;
    public readonly refmodel_code: string;
    public readonly stdout: string;
    public readonly exit_code: string;

    public constructor(public program_name: string) {
        this.tasm_source_code = fs.readFileSync(`./tests/tasm_programs/${program_name}/program.tasm`).toString();
        this.refmodel_code = fs.readFileSync(`./tests/tasm_programs/${program_name}/program.refmodel`).toString();
        this.stdout = fs.readFileSync(`./tests/tasm_programs/${program_name}/program.stdout`).toString();
        this.exit_code = fs.readFileSync(`./tests/tasm_programs/${program_name}/program.exitcode`).toString();
        this.tasm_source = {
            text: this.tasm_source_code,
            context: `${program_name}.tasm`,
        };
    }

    public set_source(new_source: string): void {
        this.tasm_source_code = new_source;
        this.tasm_source.text = new_source;
    }
}
