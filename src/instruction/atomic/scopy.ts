import { Instruction } from "../instruction";

export class SCopyInstruction extends Instruction {
    public to_asm(_instruction_index: number): string {
        return "pop rax\nmov rbx, [rsp+rax]\npush rbx\n";
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
