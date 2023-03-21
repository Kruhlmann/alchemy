import { ArgumentInstruction } from "../argument_instruction";

export class ElseInstruction extends ArgumentInstruction<number> {
    public to_asm(instruction_index: number): string {
        return `jmp addr_${this.argument}\naddr_${instruction_index + 1}:`;
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
