import {
    AddInstruction,
    BitwiseAndInstruction,
    BitwiseOrInstruction,
    EndIfInstruction,
    EqualityInstruction,
    GreaterThanInstruction,
    Instruction,
    LeftBinaryShiftInstruction,
    LessThanInstruction,
    PutInstruction,
    RightBinaryShiftInstruction,
    SubtractInstruction,
    Syscall3Instruction,
    UnreferencedElseInstruction,
    UnreferencedIfInstruction,
    UnreferencedUnlessInstruction,
} from "../instruction";

export class InstructionLookupTable {
    protected static instructions_by_symbol: Record<string, new () => Instruction> = {
        "+": AddInstruction,
        "-": SubtractInstruction,
        ">": GreaterThanInstruction,
        "<": LessThanInstruction,
        "=": EqualityInstruction,
        "|": BitwiseOrInstruction,
        "&": BitwiseAndInstruction,
        "<<": LeftBinaryShiftInstruction,
        ">>": RightBinaryShiftInstruction,
        if: UnreferencedIfInstruction,
        unless: UnreferencedUnlessInstruction,
        endif: EndIfInstruction,
        else: UnreferencedElseInstruction,
        put: PutInstruction,
        syscall3: Syscall3Instruction,
    };

    public static lookup(instruction_name: string): Instruction | undefined {
        const InstructionConstructor = this.instructions_by_symbol[instruction_name];
        if (!InstructionConstructor) {
            return undefined;
        }
        return new InstructionConstructor();
    }
}
