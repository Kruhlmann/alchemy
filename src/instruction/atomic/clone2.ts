import { Instruction } from "../instruction";

export class Clone2Instruction extends Instruction {
    public to_asm(_instruction_index: number): string {
        return "pop rbx\npop rax\npush rax\npush rbx\npush rax\npush rbx";
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
