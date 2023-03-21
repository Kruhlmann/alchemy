export class UnreferencedInstructionError extends Error {
    public name = "UnreferencedInstructionError";

    public constructor(instruction_class_name: string) {
        super(`Unreferenced instruction: ${instruction_class_name}`);
    }
}
