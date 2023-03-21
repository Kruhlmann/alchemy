import { ArgumentInstruction } from "../argument_instruction";

export class PushIntInstruction extends ArgumentInstruction<number> {
    public to_asm(): string {
        return `push ${this.argument}`;
    }
    public to_wat(): string {
        throw new Error("Method not implemented.");
    }
}
