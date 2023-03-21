export abstract class Instruction {
    public abstract to_asm(instruction_index: number): string;
    public abstract to_wat(instruction_index: number): string;

    public literal(_instruction_index: number): String | undefined {
        return undefined;
    }

    public toString(): string {
        return this.constructor.name;
    }

    public reference_to(_reference_index: number): Instruction {
        throw new Error(`Can't reference ${this.constructor.name}`);
    }
}
