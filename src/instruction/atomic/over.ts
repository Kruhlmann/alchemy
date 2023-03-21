import { Instruction } from "../instruction";

export class OverInstruction extends Instruction {
    public to_asm(_instruction_index: number): string {
        return "pop rax\npop rbx\npush rbx\npush rax\npush rbx";
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
