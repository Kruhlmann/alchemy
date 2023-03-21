import { Instruction } from "../instruction";

export class TasmReferenceModel {
    public constructor(protected instructions: Instruction[]) {}

    public toString(): string {
        return this.instructions.map((instruction) => instruction.toString()).join("\n");
    }
}
