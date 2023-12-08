import fs from "node:fs";

import { AlchemySource } from "../../src/lexer";

export class AlchemyTestProgram {
    public alchemy_source_code: string;
    public alchemy_source: AlchemySource;
    public readonly stdout: string;
    public readonly exit_code: string;

    public constructor(public program_name: string) {
        this.alchemy_source_code = fs.readFileSync(`./tests/alchemy_programs/${program_name}/program.alc`).toString();
        this.stdout = fs.readFileSync(`./tests/alchemy_programs/${program_name}/program.stdout`).toString();
        this.exit_code = fs.readFileSync(`./tests/alchemy_programs/${program_name}/program.exitcode`).toString();
        this.alchemy_source = {
            text: this.alchemy_source_code,
            context: `${program_name}.alc`,
        };
    }

    public set_source(new_source: string): void {
        this.alchemy_source_code = new_source;
        this.alchemy_source.text = new_source;
    }
}
