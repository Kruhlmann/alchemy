import { Instruction } from "../instruction";

type Class = { constructor: { name: string } };

export class UnexpectedInstructionError extends Error {
    public name = "UnexpectedInstructionError";

    public constructor(unexpected: Instruction, expected: Class, while_processing: Class) {
        super(`Unexpected ${unexpected}. Expected ${expected} while processing ${while_processing}`);
    }
}
