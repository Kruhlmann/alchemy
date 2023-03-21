import { Instruction } from "../instruction";

export class SubtractInstruction extends Instruction {
    public to_asm(_instruction_index: number): string {
        return "pop rbx\npop rax\nsub rax, rbx\npush rax";
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
