import { ArgumentInstruction } from "../argument_instruction";
import { WendInstruction } from "../atomic";
import { UnreferencedInstruction } from "../unreferenced_instruction";

export class UnreferencedWendInstruction extends UnreferencedInstruction {
    public reference_to(reference_index: number): ArgumentInstruction<number> {
        return new WendInstruction(reference_index);
    }
}
