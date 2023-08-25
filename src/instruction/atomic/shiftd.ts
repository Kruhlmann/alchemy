import { Instruction } from "../instruction";

export class ShiftDownInstruction extends Instruction {
    public to_asm(_instruction_index: number): string {
        return "pop rax\nadd rsp, rax\n";
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
