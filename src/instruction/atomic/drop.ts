import { Instruction } from "../instruction";

export class DropInstruction extends Instruction {
    public to_asm(_instruction_index: number): string {
        return "pop rax";
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
