import {
    CallInstruction,
    DoInstruction,
    EndIfInstruction,
    Instruction,
    LiteralInstruction,
    SubInstruction,
    UnreferencedDoInstruction,
    UnreferencedElseInstruction,
    UnreferencedIfInstruction,
    UnreferencedInstruction,
    UnreferencedSubInstruction,
    UnreferencedUnlessInstruction,
    UnreferencedWendInstruction,
    WhileInstruction,
} from "../instruction";
import { ArgumentInstruction } from "../instruction/argument_instruction";
import { ReferenceStackEmptyError } from "./reference_stack_empty_error";
import { ReferenceStackNotEmptyError } from "./reference_stack_not_empty_error";
import { UnexpectedInstructionError } from "./unexpected_instruction_error";

export class CrossReferencer {
    // eslint-disable-next-line complexity
    public cross_reference_instructions(instructions: Instruction[]): Instruction[] {
        const iclone = [...instructions];
        const refstack: number[] = [];
        for (let curidx = 0; curidx < iclone.length; curidx++) {
            const curinst = iclone[curidx];
            if (curinst instanceof UnreferencedIfInstruction) {
                refstack.push(curidx);
            } else if (curinst instanceof UnreferencedUnlessInstruction) {
                refstack.push(curidx);
            } else if (curinst instanceof UnreferencedSubInstruction) {
                refstack.push(curidx);
            } else if (curinst instanceof WhileInstruction) {
                refstack.push(curidx);
            } else if (curinst instanceof UnreferencedElseInstruction) {
                const previdx = refstack.pop();
                if (previdx === undefined) throw new ReferenceStackEmptyError(UnreferencedElseInstruction);
                if (!(iclone[previdx] instanceof UnreferencedInstruction)) {
                    throw new UnexpectedInstructionError(
                        iclone[previdx],
                        UnreferencedInstruction,
                        UnreferencedElseInstruction,
                    );
                }
                iclone[previdx] = iclone[previdx].reference_to(curidx + 1);
                iclone[curidx] = new UnreferencedElseInstruction();
                refstack.push(curidx);
            } else if (curinst instanceof LiteralInstruction) {
                const previdx = refstack.pop();
                if (previdx === undefined) {
                    iclone[curidx] = new CallInstruction(curinst.read_argument());
                } else if (iclone[previdx] instanceof UnreferencedSubInstruction) {
                    iclone[previdx] = new SubInstruction(curinst.read_argument());
                } else {
                    iclone[curidx] = new CallInstruction(curinst.read_argument());
                    refstack.push(previdx);
                }
            } else if (curinst instanceof EndIfInstruction) {
                const previdx = refstack.pop();
                if (previdx === undefined) throw new ReferenceStackEmptyError(EndIfInstruction);
                if (!(iclone[previdx] instanceof UnreferencedInstruction)) {
                    throw new UnexpectedInstructionError(iclone[previdx], UnreferencedInstruction, EndIfInstruction);
                }
                iclone[previdx] = iclone[previdx].reference_to(curidx);
            } else if (curinst instanceof UnreferencedDoInstruction) {
                const previdx = refstack.pop();
                if (previdx === undefined) throw new ReferenceStackEmptyError(UnreferencedDoInstruction);
                if (!(iclone[previdx] instanceof WhileInstruction)) {
                    throw new UnexpectedInstructionError(iclone[previdx], WhileInstruction, UnreferencedDoInstruction);
                }
                iclone[curidx] = iclone[curidx].reference_to(previdx);
                refstack.push(curidx);
            } else if (curinst instanceof UnreferencedWendInstruction) {
                const previdx = refstack.pop();
                if (previdx === undefined) throw new ReferenceStackEmptyError(UnreferencedWendInstruction);
                if (!(iclone[previdx] instanceof DoInstruction)) {
                    throw new UnexpectedInstructionError(iclone[previdx], DoInstruction, UnreferencedWendInstruction);
                }
                iclone[curidx] = iclone[curidx].reference_to(
                    (iclone[previdx] as ArgumentInstruction<number>).read_argument(),
                );
                iclone[previdx] = iclone[previdx].reference_to(curidx + 1);
            }
        }
        if (refstack.length > 0) {
            const dangling_instructions = refstack.map((reference_index) => iclone[reference_index]);
            throw new ReferenceStackNotEmptyError(dangling_instructions);
        }
        return iclone;
    }
}
