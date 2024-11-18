import { Instruction } from "../instruction";

export interface InstructionsPruner {
    prune(instructions: Instruction[]): Instruction[];
}
