import { ArgumentInstruction } from "../argument_instruction";
import { UnreferencedInstruction } from "../unreferenced_instruction";

export class UnreferencedSubInstruction extends UnreferencedInstruction {
    public reference_to(reference_index: number): ArgumentInstruction<number> {
        throw new Error(`Can't reference ${this.constructor.name} @ position ${reference_index}`);
    }
}
