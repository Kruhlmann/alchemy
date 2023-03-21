import { Instruction } from "../instruction";

export class EndIfInstruction extends Instruction {
    public to_asm(instruction_index: number): string {
        console.log(`addr_${instruction_index}:`);
        return `addr_${instruction_index}:`;
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
