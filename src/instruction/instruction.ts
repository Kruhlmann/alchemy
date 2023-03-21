export abstract class Instruction {
    public abstract to_asm(): string;
    public abstract to_wat(): string;

    public toString(): string {
        return this.constructor.name;
    }
}
