export class UnknownInstructionError extends Error {
    public name = "UnknownInstructionError";

    public constructor(instruction_name: string) {
        super(`No such instruciton "${instruction_name}"`);
    }
}
