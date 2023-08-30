import { ArgumentInstruction } from "../argument_instruction";

export class PushStringInstruction extends ArgumentInstruction<string> {
    public to_asm(instruction_index: number): string {
        return `push lit_${instruction_index}`;
    }
    public to_wat(): string {
        throw new Error("Method not implemented.");
    }
    public literal(instruction_index: number): string | undefined {
        if (this.argument.length === 0) {
            return `lit_${instruction_index}: db 0x00`;
        }
        const byte_array = new TextEncoder().encode(this.argument);
        const byte_hex = [...byte_array] // Convert implicityly from Uint8Array to 
                                         // Array<number> as Uint8Array has a non-standard 
                                         // .map implementation.
            .map((byte) => byte.toString(16))
            .map((byte_string) => `0x${byte_string}`)
            .join(", ");
        return `lit_${instruction_index}: db ${byte_hex}, 0x00`;
    }
    public toString(): string {
        return `${this.constructor.name}<"${this.argument}">`;
    }
}
