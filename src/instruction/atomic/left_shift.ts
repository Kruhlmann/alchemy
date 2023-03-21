import { Instruction } from "../instruction";

export class LeftBinaryShiftInstruction extends Instruction {
    public to_asm(_instruction_index: number): string {
        return "pop rcx\npop rbx\nshl rbx, cl\npush rbx";
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
