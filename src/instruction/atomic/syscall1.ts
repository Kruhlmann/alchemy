import { Instruction } from "../instruction";

export class Syscall1Instruction extends Instruction {
    public to_asm(_instruction_index: number): string {
        return "pop rax\npop rdi\nsyscall";
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
