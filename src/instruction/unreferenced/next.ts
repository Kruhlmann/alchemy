import { ArgumentInstruction } from "../argument_instruction";
import { NextInstruction } from "../atomic";
import { UnreferencedInstruction } from "../unreferenced_instruction";

export class UnreferencedNextInstruction extends UnreferencedInstruction {
    public reference_to(reference_index: number): ArgumentInstruction<number> {
        return new NextInstruction(reference_index);
    }
}
