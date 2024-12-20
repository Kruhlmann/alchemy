import { Instruction } from "../instruction";

export class ShiftUpInstruction extends Instruction {
    public to_asm(_instruction_index: number): string {
        return "pop rax\nsub rsp, rax\n";
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
