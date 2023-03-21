import { Instruction } from "../instruction";

export class AddInstruction extends Instruction {
    public to_asm(): string {
        return "pop rbx\npop rax\nadd rax, rbx\npush rax";
    }
    public to_wat(): string {
        throw new Error("Method not implemented.");
    }
}
