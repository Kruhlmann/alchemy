import { ArgumentInstruction } from "../argument_instruction";
import { IfInstruction } from "../atomic";
import { UnreferencedInstruction } from "../unreferenced_instruction";

export class UnreferencedIfInstruction extends UnreferencedInstruction {
    public reference_to(reference_index: number): ArgumentInstruction<number> {
        return new IfInstruction(reference_index);
    }
}
