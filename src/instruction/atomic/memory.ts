import { Instruction } from "../instruction";

export class PushMemoryPointerInstruction extends Instruction {
    public to_asm(_instruction_index: number): string {
        return "push mem";
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
