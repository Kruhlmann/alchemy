import { ArgumentInstruction } from "../argument_instruction";
import { ElseInstruction } from "../atomic";
import { UnreferencedInstruction } from "../unreferenced_instruction";

export class UnreferencedElseInstruction extends UnreferencedInstruction {
    public reference_to(reference_index: number): ArgumentInstruction<number> {
        return new ElseInstruction(reference_index);
    }
}
