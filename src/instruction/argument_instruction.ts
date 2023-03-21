import { Instruction } from "./instruction";

export abstract class ArgumentInstruction<ArgumentType> extends Instruction {
    public constructor(protected argument: ArgumentType) {
        super();
    }

    public toString(): string {
        return `${this.constructor.name}<${this.argument}>`;
    }

    public read_argument(): ArgumentType {
        return this.argument;
    }
}
