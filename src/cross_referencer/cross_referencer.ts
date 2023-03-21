import {
    EndIfInstruction,
    IfInstruction,
    Instruction,
    UnreferencedElseInstruction,
    UnreferencedIfInstruction,
    UnreferencedInstruction,
    UnreferencedUnlessInstruction,
} from "../instruction";

export class CrossReferencer {
    // eslint-disable-next-line complexity
    public cross_reference_instructions(instructions: Instruction[]): Instruction[] {
        const instructions_clone = [...instructions];
        const reference_stack: number[] = [];
        for (let instruction_index = 0; instruction_index < instructions_clone.length; instruction_index++) {
            const current_instruction = instructions_clone[instruction_index];
            if (current_instruction instanceof UnreferencedIfInstruction) {
                reference_stack.push(instruction_index);
            } else if (current_instruction instanceof UnreferencedUnlessInstruction) {
                reference_stack.push(instruction_index);
            } else if (current_instruction instanceof UnreferencedElseInstruction) {
                const previous_reference_index = reference_stack.pop();
                if (previous_reference_index === undefined) {
                    throw new Error("Reference stack empty");
                }
                if (!(instructions_clone[previous_reference_index] instanceof UnreferencedInstruction)) {
                    throw new TypeError("Unexpected");
                }
                instructions_clone[previous_reference_index] = instructions_clone[
                    previous_reference_index
                ].reference_to(instruction_index + 1);
                instructions_clone[instruction_index] = new UnreferencedElseInstruction();
                reference_stack.push(instruction_index);
            } else if (current_instruction instanceof EndIfInstruction) {
                const previous_reference_index = reference_stack.pop();
                if (previous_reference_index === undefined) {
                    throw new Error("Reference stack empty");
                }
                if (!(instructions_clone[previous_reference_index] instanceof UnreferencedInstruction)) {
                    throw new TypeError(
                        `Unexpected endif, when last reference was ${instructions_clone[
                            previous_reference_index
                        ].toString()}`,
                    );
                }
                instructions_clone[previous_reference_index] =
                    instructions_clone[previous_reference_index].reference_to(instruction_index);
            }
        }
        if (reference_stack.length > 0) {
            throw new Error("Reference stack not empty");
        }
        return instructions_clone;
    }
}
