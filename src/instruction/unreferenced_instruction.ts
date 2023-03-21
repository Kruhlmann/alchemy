import { ArgumentInstruction } from "./argument_instruction";
import { Instruction } from "./instruction";
import { UnreferencedInstructionError } from "./unreferenced_instruction_error";

export abstract class UnreferencedInstruction extends Instruction {
    public to_asm(_instruction_index: number): string {
        throw new UnreferencedInstructionError(this.constructor.name);
    }
    public to_wat(_instruction_index: number): string {
        throw new UnreferencedInstructionError(this.constructor.name);
    }
    public abstract reference_to(_reference_index: number): ArgumentInstruction<number>;
}
