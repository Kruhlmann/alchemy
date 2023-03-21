import { Instruction } from "../instruction";

export class LoadMemoryInstruction extends Instruction {
    public to_asm(_instruction_index: number): string {
        return "pop rax\nxor rbx, rbx\nmov bl, [rax]\npush rbx";
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
