import { Instruction } from "../instruction";

export class PutInstruction extends Instruction {
    public to_asm(_instruction_index: number): string {
        return "pop rdi\ncall dump";
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
