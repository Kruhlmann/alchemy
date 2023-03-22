import { Instruction } from "../instruction";

export class PushSyscallReturnValue extends Instruction {
    public to_asm(_instruction_index: number): string {
        return "push rax";
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
