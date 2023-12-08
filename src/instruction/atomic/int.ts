import { Instruction } from "../instruction";

export class InterruptInstruction extends Instruction {
    public to_asm(_instruction_index: number): string {
        return "pop ax\nint ax";
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
