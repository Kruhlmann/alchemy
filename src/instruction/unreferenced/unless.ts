import { ArgumentInstruction } from "../argument_instruction";
import { UnlessInstruction } from "../atomic";
import { UnreferencedInstruction } from "../unreferenced_instruction";

export class UnreferencedUnlessInstruction extends UnreferencedInstruction {
    public reference_to(reference_index: number): ArgumentInstruction<number> {
        return new UnlessInstruction(reference_index);
    }
}
