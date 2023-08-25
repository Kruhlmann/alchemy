import { Instruction } from "../instruction";

export class WriteDWordMemoryInstruction extends Instruction {
    public to_asm(_instruction_index: number): string {
        return "pop rbx\npop rax\nmov [rax], ebx";
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
