import { Instruction } from "../instruction";

export class CloneInstruction extends Instruction {
    public to_asm(_instruction_index: number): string {
        return "pop rax\npush rax\npush rax";
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
