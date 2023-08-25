import { Instruction } from "../instruction";

export class WriteQWordMemoryInstruction extends Instruction {
    public to_asm(_instruction_index: number): string {
        return "pop rbx\npop rax\nmov [rax], rbx";
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
