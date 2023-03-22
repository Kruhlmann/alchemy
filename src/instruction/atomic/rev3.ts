import { Instruction } from "../instruction";

export class Rev3Instruction extends Instruction {
    public to_asm(_instruction_index: number): string {
        return "pop rax\npop rbx\npop rcx\npush rax\npush rbx\npush rcx";
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
