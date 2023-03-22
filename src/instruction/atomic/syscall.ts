import { Instruction } from "../instruction";

export class SyscallInstruction extends Instruction {
    public to_asm(_instruction_index: number): string {
        return "pop rax\nsyscall";
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
