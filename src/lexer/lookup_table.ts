import {
    AddInstruction,
    BitwiseAndInstruction,
    BitwiseOrInstruction,
    CloneInstruction,
    DecrementInstruction,
    EndIfInstruction,
    EqualityInstruction,
    GreaterThanInstruction,
    IncrementInstruction,
    Instruction,
    LeftBinaryShiftInstruction,
    LessThanInstruction,
    PutInstruction,
    RightBinaryShiftInstruction,
    SubtractInstruction,
    Syscall3Instruction,
    UnreferencedDoInstruction,
    UnreferencedElseInstruction,
    UnreferencedIfInstruction,
    UnreferencedUnlessInstruction,
    UnreferencedWendInstruction,
    WhileInstruction,
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
        "--": DecrementInstruction,
        "++": IncrementInstruction,
        clone: CloneInstruction,
        do: UnreferencedDoInstruction,
        if: UnreferencedIfInstruction,
        unless: UnreferencedUnlessInstruction,
        endif: EndIfInstruction,
        else: UnreferencedElseInstruction,
        put: PutInstruction,
        syscall3: Syscall3Instruction,
        while: WhileInstruction,
        wend: UnreferencedWendInstruction,
    };

    public static lookup(instruction_name: string): Instruction | undefined {
        const InstructionConstructor = this.instructions_by_symbol[instruction_name];
        if (!InstructionConstructor) {
            return undefined;
        }
        return new InstructionConstructor();
    }
}
