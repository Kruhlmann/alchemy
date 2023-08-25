import { ArgumentInstruction } from "../argument_instruction";

export class PushIntInstruction extends ArgumentInstruction<BigInt> {
    public to_asm(_instruction_index: number): string {
        const hex_number = this.argument
            .toString(16)
            .padStart(16, "0")
            .toUpperCase();
        return `mov rax, 0x${hex_number}; ${this.argument.toString()}\npush rax`;
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
