import { Instruction } from "../instruction";

export class Rev4Instruction extends Instruction {
    public to_asm(_instruction_index: number): string {
        return "pop r8\npop r9\npop r10\npop r11\npush r8\npush r9\npush r10\npush r11";
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
