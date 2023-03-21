import { Instruction } from "../instruction";

export class Syscall3Instruction extends Instruction {
    public to_asm(_instruction_index: number): string {
        return "pop rax\npop rdi\npop rsi\npop rdx\nsyscall";
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
