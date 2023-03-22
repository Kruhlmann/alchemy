import { Instruction } from "../instruction";

type Class = { name: string };

export class UnexpectedInstructionError extends Error {
    public name = "UnexpectedInstructionError";

    public constructor(unexpected: Instruction, expected: Class, while_processing: Class) {
        super(`Unexpected ${unexpected}. Expected ${expected.name} while processing ${while_processing.name}`);
    }
}
