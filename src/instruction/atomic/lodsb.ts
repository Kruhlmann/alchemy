import { Instruction } from "../instruction";

export class LoadStringBytesInstruction extends Instruction {
    public to_asm(_instruction_index: number): string {
        return "lodsb";
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
