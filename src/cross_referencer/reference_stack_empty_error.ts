type Class = { name: string };

export class ReferenceStackEmptyError extends Error {
    public name = "ReferenceStackEmptyError";

    public constructor(instruction: Class) {
        super(`Reference stack empty. ${instruction.name} expected a dangling reference`);
    }
}
