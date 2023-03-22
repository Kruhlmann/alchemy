import { ArgumentInstruction } from "../argument_instruction";

export class LiteralInstruction extends ArgumentInstruction<string> {
    public to_asm(_instruction_index: number): string {
        return "";
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
