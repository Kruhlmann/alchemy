import { Instruction } from "../instruction";

export class ReadWordInstruction extends Instruction {
    public to_asm(_instruction_index: number): string {
        return "pop rax\nxor rbx, rbx\nmov bx, [rax]\npush rbx";
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
