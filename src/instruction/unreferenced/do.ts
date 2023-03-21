import { ArgumentInstruction } from "../argument_instruction";
import { DoInstruction } from "../atomic";
import { UnreferencedInstruction } from "../unreferenced_instruction";

export class UnreferencedDoInstruction extends UnreferencedInstruction {
    public reference_to(reference_index: number): ArgumentInstruction<number> {
        return new DoInstruction(reference_index);
    }
}
