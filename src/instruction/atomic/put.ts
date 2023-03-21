import { Instruction } from "../instruction";

export class PutInstruction extends Instruction {
    public to_asm(): string {
        return "pop rdi\ncall dump";
    }
    public to_wat(): string {
        throw new Error("Method not implemented.");
    }
}
