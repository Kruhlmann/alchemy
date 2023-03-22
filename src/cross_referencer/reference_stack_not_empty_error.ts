import { Instruction } from "../instruction";

export class ReferenceStackNotEmptyError extends Error {
    public name = "ReferenceStackEmptyError";

    public constructor(instructions: Instruction[]) {
        const reference_stack = instructions.map((instruction) => instruction.toString());
        super(`Reference stack not empty after cross referencing. Contained: ${reference_stack}`);
    }
}
