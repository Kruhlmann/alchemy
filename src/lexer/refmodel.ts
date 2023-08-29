import { Instruction } from "../instruction";

export class AlchemyReferenceModel {
    public constructor(protected instructions: Instruction[]) {}

    public toString(): string {
        return this.instructions.map((instruction) => instruction.toString()).join("\n");
    }
}
