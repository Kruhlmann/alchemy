import { Instruction } from "../instruction";

export class GreaterThanEqualsInstruction extends Instruction {
    public to_asm(_instruction_index: number): string {
        return "mov rcx, 0\nmov rdx, 1\npop rbx\npop rax\ncmp rax, rbx\ncmovge rcx, rdx\npush rcx";
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
