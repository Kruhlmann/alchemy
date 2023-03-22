import { ArgumentInstruction } from "../argument_instruction";

export class CallInstruction extends ArgumentInstruction<string> {
    public to_asm(_instruction_index: number): string {
        return `call usr_${this.argument}`;
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
