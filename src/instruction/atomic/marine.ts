import { Instruction } from "../instruction";

export class MarineInstruction extends Instruction {
    public to_asm(_instruction_index: number): string {
        return "ret";
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
