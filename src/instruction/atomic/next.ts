import { ArgumentInstruction } from "../argument_instruction";

export class NextInstruction extends ArgumentInstruction<number> {
    public to_asm(_instruction_index: number): string {
        return `jmp addr_${this.argument}`;
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
